import 'dart:convert';

class Order {
  final String customerName;
  final String email;
  List<OrderElement> orders;

  Order({
    required this.customerName,
    required this.email,
    required this.orders,
  });

  Order copyWith({
    String? customerName,
    String? email,
    List<OrderElement>? orders,
  }) =>
      Order(
        customerName: customerName ?? this.customerName,
        email: email ?? this.email,
        orders: orders ?? this.orders,
      );

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    customerName: json["customerName"],
    email: json["email"],
    orders: List<OrderElement>.from(json["orders"].map((x) => OrderElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customerName": customerName,
    "email": email,
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class OrderElement {
  final String id;
  final int total;
  bool isFetched;
  final DateTime createdAt;
  final List<OrderItem> orderItems;

  OrderElement({
    required this.id,
    required this.total,
    required this.isFetched,
    required this.createdAt,
    required this.orderItems,
  });

  OrderElement copyWith({
    String? id,
    int? total,
    bool? isFetched,
    DateTime? createdAt,
    List<OrderItem>? orderItems,
  }) =>
      OrderElement(
        id: id ?? this.id,
        total: total ?? this.total,
        isFetched: isFetched ?? this.isFetched,
        createdAt: createdAt ?? this.createdAt,
        orderItems: orderItems ?? this.orderItems,
      );

  factory OrderElement.fromRawJson(String str) => OrderElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderElement.fromJson(Map<String, dynamic> json) => OrderElement(
    id: json["id"],
    total: json["total"],
    isFetched: json["isFetched"],
    createdAt: DateTime.parse(json["createdAt"]),
    orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "total": total,
    "isFetched": isFetched,
    "createdAt": createdAt.toIso8601String(),
    "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
  };
}

class OrderItem {
  final String id;
  final int quantity;
  final int unitPrice;
  final Offer offer;

  OrderItem({
    required this.id,
    required this.quantity,
    required this.unitPrice,
    required this.offer,
  });

  OrderItem copyWith({
    String? id,
    int? quantity,
    int? unitPrice,
    Offer? offer,
  }) =>
      OrderItem(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        offer: offer ?? this.offer,
      );

  factory OrderItem.fromRawJson(String str) => OrderItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json["id"],
    quantity: json["quantity"],
    unitPrice: json["unitPrice"],
    offer: Offer.fromJson(json["offer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "unitPrice": unitPrice,
    "offer": offer.toJson(),
  };
}

class Offer {
  final String name;

  Offer({
    required this.name,
  });

  Offer copyWith({
    String? name,
  }) =>
      Offer(
        name: name ?? this.name,
      );

  factory Offer.fromRawJson(String str) => Offer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
