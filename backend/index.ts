import express from 'express';
// import cors from 'cors';
import bodyParser from 'body-parser';
import { getOrders, updateOrder } from './src/orders';

const app = express();
const port = 3000;

// app.use(cors());
app.use(bodyParser.json());

app.get('/orders', (req, res) => {
  res.json(getOrders());
});

app.patch('/orders/:id', (req, res) => {
  try {
    const { id } = req.params;
    const updatedOrder = updateOrder(id, req.body);
    res.status(200);
    res.send(updatedOrder);
  } catch (e) {
    res.status(500).end();
  }
});

app.listen(port, () => {
  console.log(`Backend listening on port ${port}`);
});
