import 'package:app/cubit/order_cubit.dart';
import 'package:app/model/order.dart';
import 'package:app/widgets/order_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// Widget to display all the items of an order
/// user can swipe left to mark order as picked up or not picked up yet
class OrdersList extends StatelessWidget {
  OrdersList({super.key, required this.orders});
  final List<OrderElement> orders;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OrderCubit>(context);
    return ListView.separated(
      shrinkWrap:
          true, // Improvement: use alternate widgets like column instead of using shrinkwrap
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (_, idx) {
        // Used dropdown instead of tabBar layout in favour of using slidable actions
        return Slidable(
            key: ValueKey(orders[idx].id),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    cubit.markOrder(orders[idx].id);
                    _showSnackBarWithUndo(context, orders[idx].id, cubit);
                  },
                  backgroundColor: orders[idx].isFetched
                      ? const Color(0xFFFE4A49)
                      : const Color(0xFF2E7D32),
                  foregroundColor: Colors.white,
                  icon: Icons.check,
                  label: orders[idx].isFetched ? 'Not picked' : 'Picked up',
                ),
              ],
            ),
            child: OrderElementCard(orderElement: orders[idx]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8.0);
      },
    );
  }

  void _showSnackBarWithUndo(BuildContext context, String id, OrderCubit cubit) {
    final snackBar = SnackBar(
      content: const Text('Order marked as Picked.'),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          debugPrint('snack bar clicked');
          cubit.markOrder(id);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
