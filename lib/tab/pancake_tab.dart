import 'package:donut_app/utils/pancake_tile.dart';
import 'package:flutter/material.dart';

class PancakeTab extends StatelessWidget {
  PancakeTab({super.key});

  //List of donuts
  final List pancakeOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Pancake con mantequilla',
      '100',
      Colors.brown,
      "lib/images/pancake1.webp",
      'McDonalds',
    ],
    [
      'Pancake deluxe',
      '89',
      Colors.red,
      "lib/images/pancake2.png",
      'Cafetería Rafael Abisai',
    ],
    [
      'Pancake sencillo',
      '95',
      Colors.blue,
      "lib/images/pancake3.webp",
      "McDonalds",
    ],
    [
      'Pancake pro max',
      '70',
      Colors.purple,
      "lib/images/pancake4.png",
      'iPancake',
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
      itemCount: pancakeOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
        return PancakeTile(
          pancakeFlavor: pancakeOnSale[index][0],
          pancakePrice: pancakeOnSale[index][1],
          pancakeColor: pancakeOnSale[index][2],
          pancakeImagePath: pancakeOnSale[index][3],
          pancakeProvider: pancakeOnSale[index][4],
        );
      },
    );
  }
}
