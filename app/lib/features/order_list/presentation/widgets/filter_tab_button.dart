import 'package:app/features/order_list/data/orders_repository.dart';
import 'package:app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FilterTabButton extends StatelessWidget {
  final String title;
  final OrderStatus orderState;
  final OrderStatus buttonType;
  final VoidCallback onTap;

  const FilterTabButton({
    Key? key,
    required this.title,
    required this.orderState,
    required this.buttonType,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(title.toUpperCase()),
      style: orderState == buttonType
          ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.darkCyan),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            )
          : ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.primary),
              foregroundColor: MaterialStateProperty.all(AppColors.lightAccent),
            ),
    );
  }
}
