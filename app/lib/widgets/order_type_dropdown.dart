import 'package:app/cubit/order_cubit.dart';
import 'package:app/widgets/group_by_orders_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Dropdown widget on [Appbar] from where user can select [OderType]
class OrderTypeDropdown extends StatelessWidget {
  const OrderTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoadedSuccessfully) {
          return DropdownButton<OrderType>(
            value: state.selectedOrderType,
            icon: const Icon(Icons.arrow_drop_down_sharp),
            style: const TextStyle(color: Colors.green, fontSize: 18.0),
            underline: const SizedBox(),
            onChanged: (OrderType? value) {
              context.read<OrderCubit>().updateSelectedOrderType(value);
            },
            items: OrderType.values
                .map<DropdownMenuItem<OrderType>>((OrderType value) {
              return DropdownMenuItem<OrderType>(
                value: value,
                child: Text(value.name
                    .toUpperCase()), // Improvement: create a extension on string to make its Pascal case
              );
            }).toList(),
          );
        }
        return const Text('Orders');
      },
    );
  }
}
