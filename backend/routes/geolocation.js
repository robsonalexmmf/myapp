const express = require('express');
const Geolocation = require('../models/Geolocation');
const authMiddleware = require('../middleware/auth');

const router = express.Router();

// Update geolocation for user
router.post('/update', authMiddleware, async (req, res) => {
  const { latitude, longitude, status } = req.body;
  try {
    let geo = await Geolocation.findOne({ userEmail: req.user.email });
    if (!geo) {
      geo = new Geolocation({
        userEmail: req.user.email,
        latitude,
        longitude,
        status,
      });
    } else {
      geo.latitude = latitude;
      geo.longitude = longitude;
      geo.status = status;
      geo.updatedAt = Date.now();
    }
    await geo.save();
    res.json(geo);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao atualizar geolocalização' });
  }
});

// Get geolocation for user (owner/admin can query providers)
router.get('/:email', authMiddleware, async (req, res) => {
  const { email } = req.params;
  try {
    const geo = await Geolocation.findOne({ userEmail: email });
    if (!geo) {
      return res.status(404).json({ message: 'Geolocalização não encontrada' });
    }
    res.json(geo);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao buscar geolocalização' });
  }
});

module.exports = router;
