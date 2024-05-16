import 'dart:async';

import 'package:app/model/order.dart';
import 'package:app/repository/get_orders_repo_interface.dart';
import 'package:app/widgets/group_by_orders_list.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final GetOrderInterface _getOrdersInterface;
  OrderCubit(this._getOrdersInterface) : super(OrderInitial()) {
    getOrders();
  }

  Future<void> getOrders() async {
    emit(OrderLoading());
    try {
      final response = await _getOrdersInterface.getOrders();
      emit(OrderLoadedSuccessfully(ordersList: response, selectedOrderType: OrderType.opened));
    } catch (e) {
      debugPrint('error $e');
      emit(OrderLoadingFailed());
    }
  }

  void markOrder(String orderElementId) {
    final currentState = state;
    if (currentState is OrderLoadedSuccessfully) {
      final updatedOrdersList = currentState.ordersList.map((order) {
        if (order.orders.isNotEmpty) {
          // Find the orderElement with matching orderElementId
          final updatedOrders = order.orders.map((orderElement) {
            if (orderElement.id == orderElementId) {
              // Copy the OrderElement with updated isFetched value
              return orderElement.copyWith(isFetched: !orderElement.isFetched);
            } else {
              return orderElement;
            }
          }).toList();

          // Copy the Order with updated ordersList
          return order.copyWith(orders: updatedOrders);
        } else {
          return order;
        }
      }).toList();

      // Emitting a new OrderLoadedSuccessfully state with the updated list
      emit(OrderLoadedSuccessfully(ordersList: updatedOrdersList, selectedOrderType: currentState.selectedOrderType ));
    }
  }

  void updateSelectedOrderType(OrderType? value) {
    if (state is OrderLoadedSuccessfully) {
      final currentState = state as OrderLoadedSuccessfully;
      emit(currentState.copyWith(selectedDropdownValue: value));
    }
  }
}
