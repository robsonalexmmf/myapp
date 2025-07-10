const mongoose = require('mongoose');

const serviceProviderSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  services: [{ type: String, required: true }], // List of service types
  canDiagnoseVehicle: { type: Boolean, default: false }, // For buscar/entregar carro service
  createdAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model('ServiceProvider', serviceProviderSchema);
