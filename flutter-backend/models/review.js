const mongoose = require('mongoose');

const reviewSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  productId: String,
  reviewText: String,
  coinsEarned: Number,
  createdAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model('Review', reviewSchema);
