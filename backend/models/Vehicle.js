const mongoose = require('mongoose');

const VehicleSchema = new mongoose.Schema({
  ownerEmail: { type: String, required: true },
  brand: { type: String, required: true },
  model: { type: String, required: true },
  plate: { type: String, required: true },
  year: { type: Number, required: true },
  createdAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model('Vehicle', VehicleSchema);
