const express = require('express');
const Vehicle = require('../models/Vehicle');
const authMiddleware = require('../middleware/auth');

const router = express.Router();

// Create vehicle
router.post('/', authMiddleware, async (req, res) => {
  try {
    const { brand, model, licensePlate, year } = req.body;
    const vehicle = new Vehicle({
      ownerId: req.user.userId,
      brand,
      model,
      licensePlate,
      year,
    });
    await vehicle.save();
    res.status(201).json(vehicle);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Server error' });
  }
});

// Get vehicles for owner
router.get('/', authMiddleware, async (req, res) => {
  try {
    const vehicles = await Vehicle.find({ ownerId: req.user.userId });
    res.json(vehicles);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router;
