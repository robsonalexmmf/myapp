const express = require('express');
const ServiceNeed = require('../models/ServiceNeed');
const authMiddleware = require('../middleware/auth');

const router = express.Router();

// Create a new service need
router.post('/', authMiddleware, async (req, res) => {
  try {
    const { vehicleId, serviceType, description, location, photos } = req.body;
    const newNeed = new ServiceNeed({
      ownerEmail: req.user.email,
      vehicleId,
      serviceType,
      description,
      location,
      photos,
    });
    await newNeed.save();
    res.status(201).json(newNeed);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao criar necessidade de serviço' });
  }
});

// Get all service needs for the logged-in owner
router.get('/', authMiddleware, async (req, res) => {
  try {
    const needs = await ServiceNeed.find({ ownerEmail: req.user.email });
    res.json(needs);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao buscar necessidades de serviço' });
  }
});

// Get a specific service need by ID
router.get('/:id', authMiddleware, async (req, res) => {
  try {
    const need = await ServiceNeed.findById(req.params.id);
    if (!need) {
      return res.status(404).json({ message: 'Necessidade de serviço não encontrada' });
    }
    res.json(need);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao buscar necessidade de serviço' });
  }
});

// Update a service need by ID
router.put('/:id', authMiddleware, async (req, res) => {
  try {
    const updated = await ServiceNeed.findByIdAndUpdate(req.params.id, req.body, { new: true });
    if (!updated) {
      return res.status(404).json({ message: 'Necessidade de serviço não encontrada' });
    }
    res.json(updated);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao atualizar necessidade de serviço' });
  }
});

// Delete a service need by ID
router.delete('/:id', authMiddleware, async (req, res) => {
  try {
    const deleted = await ServiceNeed.findByIdAndDelete(req.params.id);
    if (!deleted) {
      return res.status(404).json({ message: 'Necessidade de serviço não encontrada' });
    }
    res.json({ message: 'Necessidade de serviço deletada com sucesso' });
  } catch (err) {
    res.status(500).json({ message: 'Erro ao deletar necessidade de serviço' });
  }
});

module.exports = router;
