import 'package:app/features/order_list/presentation/providers/order_list_tabview.dart';
import 'package:app/shared/commons/presentation/home_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  login,
  orderList,
}

final GoRouter appRoute = GoRouter(
  initialLocation: OrderListTabview.path,
  routes: <RouteBase>[
    GoRoute(
      path: OrderListTabview.path,
      name: AppRoute.orderList.name,
      builder: (context, state) => HomePage(index: 2),
    ),
  ],
);
