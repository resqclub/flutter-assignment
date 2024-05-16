part of 'order_cubit.dart';

sealed class OrderState extends Equatable {
  const OrderState();
}

final class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}

class OrderLoading extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderLoadedSuccessfully extends OrderState {
  final List<Order> ordersList;
  final OrderType selectedOrderType;

  const OrderLoadedSuccessfully({
    required this.ordersList,
    this.selectedOrderType = OrderType.closed,
  });
  OrderLoadedSuccessfully copyWith({OrderType? selectedDropdownValue}) {
    return OrderLoadedSuccessfully(
      ordersList: ordersList,
      selectedOrderType: selectedDropdownValue ?? selectedOrderType,
    );
  }

  @override
  List<Object?> get props => [ordersList, selectedOrderType];
}

class OrderLoadingFailed extends OrderState {
  @override
  List<Object?> get props => [];
}
