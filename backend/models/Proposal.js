const mongoose = require('mongoose');

const proposalSchema = new mongoose.Schema({
  serviceNeedId: { type: mongoose.Schema.Types.ObjectId, ref: 'ServiceNeed', required: true },
  providerId: { type: mongoose.Schema.Types.ObjectId, ref: 'ServiceProvider', required: true },
  price: { type: Number, required: true },
  createdAt: { type: Date, default: Date.now },
});

proposalSchema.index({ serviceNeedId: 1, price: 1 });

module.exports = mongoose.model('Proposal', proposalSchema);
