const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/User');

const router = express.Router();

const JWT_SECRET = 'your_jwt_secret_key'; // Replace with env variable in production

// Mock users for owner, provider, admin
const mockUsers = [
  {
    email: 'owner@example.com',
    passwordHash: bcrypt.hashSync('owner123', 10),
    role: 'owner',
    name: 'Proprietário Exemplo',
  },
  {
    email: 'provider@example.com',
    passwordHash: bcrypt.hashSync('provider123', 10),
    role: 'provider',
    name: 'Prestador Exemplo',
  },
  {
    email: 'admin@example.com',
    passwordHash: bcrypt.hashSync('admin123', 10),
    role: 'admin',
    name: 'Administrador Exemplo',
  },
];

// Login route
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  // Check against mock users
  const mockUser = mockUsers.find(u => u.email === email);
  if (mockUser) {
    const isPasswordValid = bcrypt.compareSync(password, mockUser.passwordHash);
    if (!isPasswordValid) {
      return res.status(401).json({ message: 'Senha inválida' });
    }
    const token = jwt.sign({ email: mockUser.email, role: mockUser.role }, JWT_SECRET, { expiresIn: '1d' });
    return res.json({ token, user: { email: mockUser.email, role: mockUser.role, name: mockUser.name } });
  }

  // Otherwise, check in DB
  try {
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(401).json({ message: 'Usuário não encontrado' });
    }
    const isPasswordValid = await bcrypt.compare(password, user.passwordHash);
    if (!isPasswordValid) {
      return res.status(401).json({ message: 'Senha inválida' });
    }
    const token = jwt.sign({ email: user.email, role: user.role }, JWT_SECRET, { expiresIn: '1d' });
    return res.json({ token, user: { email: user.email, role: user.role, name: user.name } });
  } catch (err) {
    return res.status(500).json({ message: 'Erro no servidor' });
  }
});

module.exports = router;
