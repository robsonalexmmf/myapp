const mongoose = require('mongoose');

const serviceNeedSchema = new mongoose.Schema({
  ownerId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  vehicleId: { type: mongoose.Schema.Types.ObjectId, ref: 'Vehicle', required: true },
  serviceType: { type: String, required: true },
  location: {
    type: { type: String, enum: ['Point'], default: 'Point' },
    coordinates: { type: [Number], required: true }, // [longitude, latitude]
  },
  description: { type: String },
  createdAt: { type: Date, default: Date.now },
});

serviceNeedSchema.index({ location: '2dsphere' });

module.exports = mongoose.model('ServiceNeed', serviceNeedSchema);
