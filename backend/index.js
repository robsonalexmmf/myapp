const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bodyParser = require('body-parser');
const authRoutes = require('./routes/auth');
const vehicleRoutes = require('./routes/vehicles');
const paymentRoutes = require('./routes/payments');
const geolocationRoutes = require('./routes/geolocation');
const serviceExecutionRoutes = require('./routes/service_execution');

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes

app.use('/api/auth', authRoutes);
app.use('/api/vehicles', vehicleRoutes);
app.use('/api/payments', paymentRoutes);
app.use('/api/geolocation', geolocationRoutes);
const serviceNeedsRoutes = require('./routes/service_needs');
app.use('/api/service-needs', serviceNeedsRoutes);
app.use('/api/service-execution', serviceExecutionRoutes);

const mongoUri = 'mongodb+srv://robsonmmfata:<32080910@Eu>@cluster0.cajuuec.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0';

// Connect to MongoDB
mongoose.connect(mongoUri, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
}).then(() => {
  console.log('MongoDB connected');
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}).catch((err) => {
  console.error('MongoDB connection error:', err);
});
