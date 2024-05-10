import 'package:app/features/order_list/domain/offer.dart';

class OrderItem {
  final String id;
  final int quantity;
  final int unitPrice;
  final Offer offer;

  OrderItem(
      {required this.id,
      required this.quantity,
      required this.unitPrice,
      required this.offer});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      quantity: json['quantity'],
      unitPrice: json['unitPrice'],
      offer: Offer.fromJson(json['offer']),
    );
  }
}
