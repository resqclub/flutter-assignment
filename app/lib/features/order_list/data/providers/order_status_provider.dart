import 'package:app/features/order_list/data/orders_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderStatus = StateProvider<OrderStatus>((ref) => OrderStatus.open);
