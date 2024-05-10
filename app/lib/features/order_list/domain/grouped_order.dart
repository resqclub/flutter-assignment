import 'package:app/features/order_list/domain/order_item.dart';

class GroupedOrder {
  final String id;
  final int total;
  final bool isFetched;
  final DateTime createdAt;
  final String customerName;
  final String email;
  final List<OrderItem> orderItems;

  GroupedOrder(
      {required this.id,
      required this.total,
      required this.isFetched,
      required this.createdAt,
      required this.customerName,
      required this.email,
      required this.orderItems});

  factory GroupedOrder.fromJson(Map<String, dynamic> json) {
    return GroupedOrder(
      id: json['id'],
      total: json['total'],
      isFetched: json['isFetched'],
      createdAt: DateTime.parse(json['createdAt']),
      customerName: json['customerName'],
      email: json['email'],
      orderItems: json['orderItems']
          .map<OrderItem>((item) => OrderItem.fromJson(item))
          .toList(),
    );
  }
}
