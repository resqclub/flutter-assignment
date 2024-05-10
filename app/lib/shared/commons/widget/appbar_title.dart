import 'package:app/features/order_list/presentation/providers/order_count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarTitle extends ConsumerWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderCount = ref.watch(orderCountProvider);
    return Text('Orders'.toUpperCase() + orderCount.toString());
  }
}
