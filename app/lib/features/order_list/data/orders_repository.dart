import 'dart:convert';
import 'dart:math';

import 'package:app/constants/mockup_products.dart';
import 'package:app/features/order_list/domain/grouped_order.dart';
import 'package:app/features/order_list/domain/order_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class OrdersNotifier extends StateNotifier<List<GroupedOrder>> {
  OrdersNotifier() : super(<GroupedOrder>[]);

  void getOrders() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/orders'));
      final List<dynamic> jsonDecoded = jsonDecode(response.body);
      final List<GroupedOrder> groupedOrders =
          jsonDecoded.map((item) => GroupedOrder.fromJson(item)).toList();
      state = groupedOrders;
    } catch (e) {
      throw Exception(
          'Could not fetch the orders. Make sure that the backend is running');
    }
  }

  void updateOrder(String orderId) async {
    try {
      final response =
          await http.patch(Uri.parse('http://localhost:3000/orders/$orderId'));
      final List<dynamic> jsonDecoded = jsonDecode(response.body);
      final List<GroupedOrder> groupedOrders =
          jsonDecoded.map((item) => GroupedOrder.fromJson(item)).toList();
      state = groupedOrders;
    } catch (e) {
      throw Exception(
          'Could not update the orders. Make sure that the backend is running');
    }
    state = state.where((order) => order.id != orderId).toList();
  }
}

enum OrderStatus {
  open,
  closed,
  all,
}
