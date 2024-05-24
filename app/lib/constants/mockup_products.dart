import 'dart:convert';

import 'package:app/features/order_list/domain/grouped_order.dart';
import 'package:app/features/order_list/domain/offer.dart';
import 'package:app/features/order_list/domain/order_item.dart';
import 'package:flutter/services.dart';

// List<GroupedOrder> mockupProducts = await fetchMockupProducts();

Future<List<GroupedOrder>> fetchMockupProducts() async {
  String content = await rootBundle.loadString('assets/mockup_products.json');
  final List<dynamic> jsonDecoded = jsonDecode(content);
  final List<GroupedOrder> groupedOrders =
      jsonDecoded.map((item) => GroupedOrder.fromJson(item)).toList();
  return groupedOrders;
}
