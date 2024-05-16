import 'package:app/cubit/order_cubit.dart';
import 'package:app/model/order.dart';
import 'package:app/widgets/group_by_orders_list.dart';
import 'package:app/widgets/order_type_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Parent Widget(screen) to display whole UI
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const OrderTypeDropdown(),
        ),
        body: Builder(builder: (builder) {
          if (state is OrderLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Improvement: Add shimmer to mimic UI instead of loading indicator
          }

          if (state is OrderLoadingFailed) {
            return const Center(
              child: Text(
                  'Oops, something went wrong'), // Improvement: Add proper error UI with illustration or lottie and error message
            );
          }

          if (state is OrderLoadedSuccessfully) {
            List<Order> ordersList = state.ordersList;
            final selectedOrderType = state.selectedOrderType;
            List<Order> updatedOrdersList;

            // Getting subset of list items based on isFetched value
            // isFetched is true considering as closed(already picked up)
            // isFetch is false considering as opened(not yet picked up)
            switch (selectedOrderType) {
              case OrderType.opened:
                updatedOrdersList = _filterOrders(ordersList, false);
                break;
              case OrderType.closed:
                updatedOrdersList = _filterOrders(ordersList, true);
                break;
              case OrderType.all:
                updatedOrdersList = ordersList;
                break;
            }
            return GroupByOrdersList(ordersList: updatedOrdersList);
          }

          return const SizedBox();
        }),
      );
    });
  }

  List<Order> _filterOrders(List<Order> ordersList, bool isFetched) {
    // Filtering out the list items based on dropdown user selected like opened/closed/all
    return ordersList.map((order) {
      return Order(
        customerName: order.customerName,
        email: order.email,
        orders: order.orders
            .where((orderElement) => orderElement.isFetched == isFetched)
            .toList(),
      );
    }).toList();
  }
}
