const mongoose = require('mongoose');

const ServiceExecutionSchema = new mongoose.Schema({
  serviceNeedId: { type: mongoose.Schema.Types.ObjectId, ref: 'ServiceNeed', required: true },
  providerId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  status: { type: String, enum: ['pending', 'in_progress', 'completed', 'cancelled'], default: 'pending' },
  photos: [{ type: String }], // URLs or base64 strings
  location: {
    latitude: { type: Number },
    longitude: { type: Number },
  },
  startedAt: { type: Date },
  completedAt: { type: Date },
  createdAt: { type: Date, default: Date.now },
  updatedAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model('ServiceExecution', ServiceExecutionSchema);
