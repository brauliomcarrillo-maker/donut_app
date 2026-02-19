import 'package:donut_app/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  BurgerTab({super.key});

  //List of donuts
  final List burgerOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
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
      //Se encarga de acomodar elementos dentro del grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //Cantidad de columnas
        crossAxisCount: 2,
        //Tamaño de cada columna
        childAspectRatio: 1 / 1.5,
      ),
      //Cantidad de elementos
      itemCount: burgerOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: burgerOnSale[index][0],
          burgerPrice: burgerOnSale[index][1],
          burgerColor: burgerOnSale[index][2],
          burgerImagePath: burgerOnSale[index][3],
          burgerProvider: burgerOnSale[index][4],
        );
      },
    );
  }
}
