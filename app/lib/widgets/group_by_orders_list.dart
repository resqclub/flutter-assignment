import 'package:app/model/order.dart';
import 'package:app/widgets/orders_list.dart';
import 'package:flutter/material.dart';

enum OrderType {
  opened,
  closed,
  all,
}

/// widget to group all the orders of single user
/// this grouped by email of user
class GroupByOrdersList extends StatelessWidget {
  const GroupByOrdersList({super.key, required this.ordersList});
  final List<Order> ordersList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: UniqueKey(),
        itemCount: ordersList.length,
        itemBuilder: (BuildContext context, int index) {
          // Return an empty SizedBox when all the orders of an user are not in selected order type
          if (ordersList[index].orders.isEmpty) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              Text(
                ordersList[index].customerName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              OrdersList(orders: ordersList[index].orders),
              const SizedBox(
                height: 16.0,
              ),
            ],
          );
        });
  }
}
