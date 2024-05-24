import 'package:app/features/order_list/data/orders_repository.dart';
import 'package:app/features/order_list/domain/grouped_order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allOrdersProvider =
    StateNotifierProvider<OrdersNotifier, List<GroupedOrder>>((ref) {
  return OrdersNotifier();
});

final allOpenOrdersProvider = Provider<Iterable<GroupedOrder>>((ref) {
  final orders = ref.watch(allOrdersProvider);
  return orders.where((order) => order.isFetched == false);
});

final allClosedOrdersProvider = Provider<Iterable<GroupedOrder>>((ref) {
  final orders = ref.watch(allOrdersProvider);
  return orders.where((order) => order.isFetched == true);
});
