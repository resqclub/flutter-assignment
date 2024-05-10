import 'package:app/features/order_list/domain/grouped_order.dart';
import 'package:app/features/order_list/presentation/widgets/order_item_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupedOrderList extends ConsumerWidget {
  const GroupedOrderList(this.groupedOrder, {super.key});
  final GroupedOrder groupedOrder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(groupedOrder.customerName),
            Column(
              children: [
                const Icon(Icons.schedule),
                Text(groupedOrder.createdAt.toString()),
              ],
            )
          ],
        ),
        ListView.builder(
          itemCount: groupedOrder.orderItems.length,
          itemBuilder: (context, index) {
            return OrderItemLine(groupedOrder.orderItems[index]);
          },
        ),
      ],
    );
  }
}
