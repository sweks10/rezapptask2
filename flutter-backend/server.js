// server.js

require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

// Create app
const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// MongoDB connection
mongoose.connect(process.env.MONGO_URI || 'mongodb://localhost:27017/flutter_review_app', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log('MongoDB connected'))
.catch((err) => console.error('MongoDB connection error:', err));

// Schemas
const UserSchema = new mongoose.Schema({
  name: String,
  coins: { type: Number, default: 0 }
});

const ReviewSchema = new mongoose.Schema({
  userId: mongoose.Schema.Types.ObjectId,
  productId: String,
  text: String,
  rating: Number,
  timestamp: { type: Date, default: Date.now }
});

const User = mongoose.model('User', UserSchema);
const Review = mongoose.model('Review', ReviewSchema);

// Routes

// ✅ Create user
app.post('/users', async (req, res) => {
  const { name } = req.body;
  try {
    const user = new User({ name });
    await user.save();
    res.json(user);
  } catch (err) {
    res.status(500).json({ message: 'Error creating user' });
  }
});

// ✅ Get user info (coins, etc.)
app.get('/users/:userId', async (req, res) => {
  const { userId } = req.params;
  try {
    const user = await User.findById(userId);
    if (!user) return res.status(404).json({ message: 'User not found' });
    res.json({ coins: user.coins });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching user' });
  }
});

// ✅ Submit review and award coins
app.post('/reviews', async (req, res) => {
  const { userId, productId, text, rating } = req.body;

  try {
    const review = new Review({ userId, productId, text, rating });
    await review.save();

    const coinsEarned = 10;
    await User.findByIdAndUpdate(userId, { $inc: { coins: coinsEarned } });

    res.json({ success: true, message: 'Review submitted and coins awarded' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: 'Error saving review' });
  }
});

// Start server
app.listen(PORT, () => {
  console.log(`✅ Server is running on port ${PORT}`);
});
