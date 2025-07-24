const request = require('supertest');
const express = require('express');
const authRoutes = require('../routes/auth');

const app = express();
app.use(express.json());
app.use('/api/auth', authRoutes);

describe('Auth API', () => {
  jest.setTimeout(15000);

  it('should login with valid mock user', async () => {
    const res = await request(app)
      .post('/api/auth/login')
      .send({ email: 'provider@example.com', password: 'provider123' });
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('token');
    expect(res.body.user).toHaveProperty('email', 'provider@example.com');
  });

  it('should fail login with invalid password', async () => {
    const res = await request(app)
      .post('/api/auth/login')
      .send({ email: 'provider@example.com', password: 'wrongpassword' });
    expect(res.statusCode).toEqual(401);
    expect(res.body).toHaveProperty('message', 'Senha inválida');
  });

  it('should fail login with unknown user', async () => {
    return request(app)
      .post('/api/auth/login')
      .send({ email: 'unknown@example.com', password: 'password' })
      .then(res => {
        expect(res.statusCode).toEqual(500);
        expect(res.body).toHaveProperty('message', 'Erro no servidor');
      });
  });
});
