const express = require('express');
const router = express.Router();
const Review = require('../models/Review');
const User = require('../models/User');

router.post('/', async (req, res) => {
  const { userId, productId, reviewText, coinsEarned } = req.body;
  try {
    const review = await Review.create({ userId, productId, reviewText, coinsEarned });
    await User.findByIdAndUpdate(userId, { $inc: { coins: coinsEarned } });
    res.status(201).json({ message: 'Review saved and coins added', review });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
