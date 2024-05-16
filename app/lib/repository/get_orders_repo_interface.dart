import 'package:app/model/order.dart';

abstract class GetOrderInterface {
  Future<List<Order>> getOrders();
}
