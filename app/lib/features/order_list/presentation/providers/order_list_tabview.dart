import 'package:app/features/order_list/presentation/providers/order_count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderListTabview extends ConsumerWidget {
  const OrderListTabview({super.key});
  static String path = '/order-list-tabview';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _orderCount = ref.watch(orderCountProvider);
    return Center(
      child: ListView(),
    );
  }
}
