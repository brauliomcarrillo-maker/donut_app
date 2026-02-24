import 'package:donut_app/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatefulWidget {
  const BurgerTab({super.key});

  @override
  State<BurgerTab> createState() => _BurgerTabState();
}

class _BurgerTabState extends State<BurgerTab> {
  // Lista de hamburguesas
  final List burgerOnSale = [
    [
      'Cheese burger',
      '100',
      Colors.brown,
      "lib/images/cheeseburger.png",
      'McDonalds',
    ],
    [
      'Chicken burger',
      '89',
      Colors.red,
      "lib/images/chicken_burger.png",
      'McDonalds',
    ],
    [
      'Western bacon',
      '95',
      Colors.blue,
      "lib/images/Western_Bacon_Deidad.webp",
      "Carl's Jr",
    ],
    [
      'Hawaiana burger',
      '70',
      Colors.purple,
      "lib/images/hawaian_burger.png",
      'Angry Angus',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: burgerOnSale.length,
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: burgerOnSale[index][0],
          burgerPrice: burgerOnSale[index][1],
          burgerColor: burgerOnSale[index][2],
          burgerImagePath: burgerOnSale[index][3],
          burgerProvider: burgerOnSale[index][4],
          onAdd: () {
            setState(() {}); // 🔥 actualiza en tiempo real
          },
        );
      },
    );
  }
}
