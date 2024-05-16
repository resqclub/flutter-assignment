import 'package:app/model/order.dart';
import 'package:app/widgets/order_details_row.dart';
import 'package:app/widgets/order_item_row.dart';
import 'package:flutter/material.dart';

/// Card widget which holds all the details related to order
/// like order created time, total amount and list of order items
class OrderElementCard extends StatelessWidget {
  const OrderElementCard({super.key, required this.orderElement});
  final OrderElement orderElement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Column(
          children: [
            OrderDetailsRow(
              total: orderElement.total,
              createdAt: orderElement.createdAt,
            ),
            ...orderElement.orderItems.map((e) => OrderItemRow(orderItem: e)),
          ],
        ),
      ),
    );
  }
}
