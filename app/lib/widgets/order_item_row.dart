import 'package:app/model/order.dart';
import 'package:flutter/material.dart';

/// widget to display each item with name, quantity and price
class OrderItemRow extends StatelessWidget {
  const OrderItemRow({super.key, required this.orderItem});
  final OrderItem orderItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      // Improvement: update UI with better designs
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${orderItem.quantity} x ${orderItem.offer.name}'),
          Text(
            '€ ${orderItem.unitPrice}',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
