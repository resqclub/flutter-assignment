import 'dart:convert';
import 'dart:async';
import 'package:app/features/order_list/presentation/widgets/order_list_tabview.dart';
import 'package:app/shared/commons/widget/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.index});

  int index;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _orderCount = 0;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Templates Page')),
    Center(child: Text('Offers list Page')),
    OrderListTabview(),
    Center(child: Text('Account Page')),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  // @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(Duration(seconds: 1), (Timer t) => getOrders());
  //   ;
  // }

  // void getOrders() async {
  //   final response = await http.get(Uri.parse('http://localhost:3000/orders'));
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     // setState(() {
  //     //   _orderCount = data.length;
  //     // });
  //   } else {
  //     debugPrint(
  //         'Could not fetch the orders. Make sure that the backend is running');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const AppBarTitle(),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outlined),
            onPressed: () {},
          ),
        ],
        // bottom: TabBar(
        //   tabs: [
        //     Tab(text: 'Open'.toUpperCase()),
        //     Tab(text: 'Closed'.toUpperCase()),
        //     Tab(text: 'All'.toUpperCase()),
        //   ],
        // ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.list_alt),
            label: 'Templates'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            label: 'Offers'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            label: 'Orders'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle_outlined),
            label: 'Account'.toUpperCase(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
