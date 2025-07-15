const express = require('express');
const stripe = require('stripe')('your_stripe_secret_key'); // Replace with your Stripe secret key
const paypal = require('@paypal/checkout-server-sdk');
const authMiddleware = require('../middleware/auth');

const router = express.Router();

// PayPal environment setup
let environment = new paypal.core.SandboxEnvironment('your_paypal_client_id', 'your_paypal_client_secret');
let client = new paypal.core.PayPalHttpClient(environment);

// Create Stripe payment intent
router.post('/stripe/create-payment-intent', authMiddleware, async (req, res) => {
  const { amount, currency } = req.body;
  try {
    const paymentIntent = await stripe.paymentIntents.create({
      amount,
      currency,
    });
    res.json({ clientSecret: paymentIntent.client_secret });
  } catch (err) {
    res.status(500).json({ message: 'Erro ao criar pagamento Stripe' });
  }
});

// Create PayPal order
router.post('/paypal/create-order', authMiddleware, async (req, res) => {
  const { amount, currency } = req.body;
  const request = new paypal.orders.OrdersCreateRequest();
  request.prefer('return=representation');
  request.requestBody({
    intent: 'CAPTURE',
    purchase_units: [{
      amount: {
        currency_code: currency,
        value: amount,
      },
    }],
  });

  try {
    const order = await client.execute(request);
    res.json({ id: order.result.id });
  } catch (err) {
    res.status(500).json({ message: 'Erro ao criar pedido PayPal' });
  }
});

// Capture PayPal order
router.post('/paypal/capture-order', authMiddleware, async (req, res) => {
  const { orderId } = req.body;
  const request = new paypal.orders.OrdersCaptureRequest(orderId);
  request.requestBody({});

  try {
    const capture = await client.execute(request);
    res.json(capture.result);
  } catch (err) {
    res.status(500).json({ message: 'Erro ao capturar pedido PayPal' });
  }
});

module.exports = router;
