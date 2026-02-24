import 'package:flutter/material.dart';

import 'package:donut_app/tab/burger_tab.dart';
import 'package:donut_app/tab/donut_tab.dart';
import 'package:donut_app/tab/pancake_tab.dart';
import 'package:donut_app/tab/pizza_tab.dart';
import 'package:donut_app/tab/smoothie_tab.dart';

import 'package:donut_app/utils/my_tab.dart';
import 'package:donut_app/cart.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = const [
    MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donut'),
    MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
    MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
    MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'Pancake'),
    MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800]),
            ),
          ],
        ),
        body: Column(
          children: [
            // TÍTULO
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: const [
                  Text('I want to ', style: TextStyle(fontSize: 24)),
                  Text(
                    'Eat',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            // TABS
            TabBar(tabs: myTabs),

            // CONTENIDO DE TABS
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PancakeTab(),
                  PizzaTab(),
                ],
              ),
            ),

            // BARRA INFERIOR DEL CARRITO
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedBuilder(
                          animation: Cart(),
                          builder: (context, _) {
                            return Text(
                              '${Cart().itemCount} Items | \$${Cart().totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            );
                          },
                        ),
                        const Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      ).then((_) {
                        setState(() {}); // 🔥 refresca al volver
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[200],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'View Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
