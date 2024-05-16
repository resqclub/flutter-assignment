import 'dart:convert';
import 'dart:io';

import 'package:app/model/order.dart';
import 'package:app/repository/get_orders_repo_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetOrdersRepositoryImpl extends GetOrderInterface {
  @override
  Future<List<Order>> getOrders() async {
    final response = await http.get(Uri.parse(
        'http://${(kIsWeb || Platform.isIOS) ? 'localhost' : '10.0.2.2'}:3000/orders'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // It is advisable to do this grouping heavy lifting on server side and then send the grouped data to client
      // since this is a flutter assignment the grouping was coded here else I prefer to do it on backend side
      Map<String, List<Map<String, dynamic>>> groupedOrders = {};

      // Group orders by email which is unique to users
      data.forEach((index, order) {
        if (_isInteger(index)) {
          String email = order['email'];
          if (!groupedOrders.containsKey(email)) {
            groupedOrders[email] = [];
          }
          groupedOrders[email]!.add(order);
        }
      });

      // Updating the json into desired format
      List<Map<String, dynamic>> outputJson = [];
      groupedOrders.forEach((email, orders) {
        List<Map<String, dynamic>> formattedOrders = [];
        for (var order in orders) {
          Map<String, dynamic> formattedOrder = {
            'id': order['id'],
            'total': order['total'],
            'isFetched': order['isFetched'],
            'createdAt': order['createdAt'],
            'orderItems': order['orderItems']
          };
          formattedOrders.add(formattedOrder);
        }

        Map<String, dynamic> groupedOrder = {
          'customerName': orders.first['customerName'],
          'email': email,
          'orders': formattedOrders,
        };
        outputJson.add(groupedOrder);
      });
      return outputJson.map((e) => Order.fromJson(e)).toList();
    } else {
      debugPrint(
          'Could not fetch the orders. Make sure that the backend is running');
      return [];
    }
  }
}

// method to parse integers to string
bool _isInteger(String s) {
  try {
    int.parse(s);
    return true;
  } catch (_) {
    return false;
  }
}
