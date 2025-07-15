const express = require('express');
const Vehicle = require('../models/Vehicle');
const authMiddleware = require('../middleware/auth');

const router = express.Router();

// Get all vehicles for logged in user
router.get('/', authMiddleware, async (req, res) => {
  try {
    const vehicles = await Vehicle.find({ ownerEmail: req.user.email });
    res.json(vehicles);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao buscar veículos' });
  }
});

// Add new vehicle
router.post('/', authMiddleware, async (req, res) => {
  const { brand, model, plate, year } = req.body;
  try {
    const vehicle = new Vehicle({
      ownerEmail: req.user.email,
      brand,
      model,
      plate,
      year,
    });
    await vehicle.save();
    res.status(201).json(vehicle);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao adicionar veículo' });
  }
});

// Update vehicle by id
router.put('/:id', authMiddleware, async (req, res) => {
  const { id } = req.params;
  const { brand, model, plate, year } = req.body;
  try {
    const vehicle = await Vehicle.findOneAndUpdate(
      { _id: id, ownerEmail: req.user.email },
      { brand, model, plate, year },
      { new: true }
    );
    if (!vehicle) {
      return res.status(404).json({ message: 'Veículo não encontrado' });
    }
    res.json(vehicle);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao atualizar veículo' });
  }
});

// Delete vehicle by id
router.delete('/:id', authMiddleware, async (req, res) => {
  const { id } = req.params;
  try {
    const vehicle = await Vehicle.findOneAndDelete({ _id: id, ownerEmail: req.user.email });
    if (!vehicle) {
      return res.status(404).json({ message: 'Veículo não encontrado' });
    }
    res.json({ message: 'Veículo removido com sucesso' });
  } catch (err) {
    res.status(500).json({ message: 'Erro ao remover veículo' });
  }
});

module.exports = router;
