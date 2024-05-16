import 'package:flutter/material.dart';

/// widget to display oder created time and total amount
class OrderDetailsRow extends StatelessWidget {
  const OrderDetailsRow(
      {super.key, required this.total, required this.createdAt});
  final int total;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Improvement: add better UI with updated designs
      decoration: const BoxDecoration(
        color: Color(0xffc8e6c9),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: € $total'),
            Text('Time ${createdAt.hour}:${createdAt.minute}'),
          ],
        ),
      ),
    );
  }
}
