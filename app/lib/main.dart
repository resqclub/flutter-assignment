import 'package:app/cubit/order_cubit.dart';
import 'package:app/pages/orders_page.dart';
import 'package:app/repository/get_orders_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Improvement: Add translations and to support currency formats
    return MaterialApp(
      title: 'Resq Flutter Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => OrderCubit(
            GetOrdersRepositoryImpl()), // By using the interface and implementation it's easy for us to switch b/w interfaces like interface for production, interface for local server
        child: const OrderScreen(),
      ),
    );
  }
}
