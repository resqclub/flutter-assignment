import 'package:app/features/order_list/data/orders_repository.dart';
import 'package:app/features/order_list/data/providers/order_count_provider.dart';
import 'package:app/features/order_list/data/providers/order_status_provider.dart';
import 'package:app/features/order_list/presentation/widgets/filter_tab_button.dart';
import 'package:app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderListTabview extends ConsumerWidget {
  const OrderListTabview({super.key});
  static String path = '/order-list-tabview';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _orderCount = ref.watch(orderCountProvider);
    final _orderState = ref.watch(orderStatus);
    return Column(
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: AppColors.primary,
          child: OverflowBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterTabButton(
                title: 'open',
                orderState: _orderState,
                buttonType: OrderStatus.open,
                onTap: () {},
              ),
              FilterTabButton(
                title: 'closed',
                orderState: _orderState,
                buttonType: OrderStatus.closed,
                onTap: () {},
              ),
              FilterTabButton(
                title: 'all',
                orderState: _orderState,
                buttonType: OrderStatus.all,
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SingleChildScrollView(
          // child: Container(),
          // child: Text('a'),
          ListView.builder(
            itemCount: _orderCount,
            itemBuilder: (context, index) {
            return ListTile(
              title: Text('Order $index'),
              subtitle: Text('Order $index'),
            );
          },
        ),
      ],
    );
  }
}
