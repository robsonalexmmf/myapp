const express = require('express');
const router = express.Router();
const ServiceExecution = require('../models/ServiceExecution');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

// Configure multer for file uploads
const uploadDir = path.join(__dirname, '../uploads/service-execution');
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, uploadDir);
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + path.extname(file.originalname));
  }
});
const upload = multer({ storage: storage });

// Create new service execution record
router.post('/', async (req, res) => {
  try {
    const { serviceNeedId, providerId } = req.body;
    const newExecution = new ServiceExecution({ serviceNeedId, providerId });
    await newExecution.save();
    res.status(201).json(newExecution);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao criar execução do serviço', error });
  }
});

// Upload photos for a service execution
router.post('/:id/photos', upload.array('photos', 10), async (req, res) => {
  try {
    const execution = await ServiceExecution.findById(req.params.id);
    if (!execution) {
      return res.status(404).json({ message: 'Execução do serviço não encontrada' });
    }
    const photoPaths = req.files.map(file => `/uploads/service-execution/${file.filename}`);
    execution.photos.push(...photoPaths);
    execution.updatedAt = new Date();
    await execution.save();
    res.status(200).json(execution);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao fazer upload das fotos', error });
  }
});

// Update geolocation for a service execution
router.put('/:id/location', async (req, res) => {
  try {
    const { latitude, longitude } = req.body;
    const execution = await ServiceExecution.findById(req.params.id);
    if (!execution) {
      return res.status(404).json({ message: 'Execução do serviço não encontrada' });
    }
    execution.location = { latitude, longitude };
    execution.updatedAt = new Date();
    await execution.save();
    res.status(200).json(execution);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao atualizar localização', error });
  }
});

// Update status of service execution
router.put('/:id/status', async (req, res) => {
  try {
    const { status } = req.body;
    const validStatuses = ['pending', 'in_progress', 'completed', 'cancelled'];
    if (!validStatuses.includes(status)) {
      return res.status(400).json({ message: 'Status inválido' });
    }
    const execution = await ServiceExecution.findById(req.params.id);
    if (!execution) {
      return res.status(404).json({ message: 'Execução do serviço não encontrada' });
    }
    execution.status = status;
    if (status === 'in_progress') {
      execution.startedAt = new Date();
    }
    if (status === 'completed') {
      execution.completedAt = new Date();
    }
    execution.updatedAt = new Date();
    await execution.save();
    res.status(200).json(execution);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao atualizar status', error });
  }
});

module.exports = router;
