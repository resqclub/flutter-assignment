import 'package:app/features/order_list/domain/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderItemLine extends ConsumerWidget {
  const OrderItemLine(this.orderItem, {super.key});
  final OrderItem orderItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Icon(Icons.room_service),
            const Text('x'),
            Text(orderItem.offer.name)
          ],
        ),
        ElevatedButton(
            onPressed: () {}, child: Text(orderItem.unitPrice.toString())),
      ],
    );
  }
}
