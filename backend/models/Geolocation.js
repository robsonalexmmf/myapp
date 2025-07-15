const mongoose = require('mongoose');

const GeolocationSchema = new mongoose.Schema({
  userEmail: { type: String, required: true },
  latitude: { type: Number, required: true },
  longitude: { type: Number, required: true },
  status: { type: String, enum: ['idle', 'en_route', 'arrived'], default: 'idle' },
  updatedAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model('Geolocation', GeolocationSchema);
