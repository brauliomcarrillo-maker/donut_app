import 'package:donut_app/utils/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  SmoothieTab({super.key});

  //List of donuts
  final List smoothieOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Smoothie de algo',
      '100',
      Colors.brown,
      "lib/images/smoothie1.png",
      'Papa´s Frappería',
    ],
    [
      'Smoothie de fresa',
      '89',
      Colors.red,
      "lib/images/smoothie2.png",
      'Dunkin donuts',
    ],
    [
      'Smoothie de fresa dos',
      '95',
      Colors.blue,
      "lib/images/smoothie3.webp",
      "Dunkin donuts",
    ],
    [
      'Smoothie de algo amarillo',
      '70',
      Colors.purple,
      "lib/images/smoothie4.png",
      'McDonalds',
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
      itemCount: smoothieOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
        return SmoothieTile(
          smoothieFlavor: smoothieOnSale[index][0],
          smoothiePrice: smoothieOnSale[index][1],
          smoothieColor: smoothieOnSale[index][2],
          smoothieImagePath: smoothieOnSale[index][3],
          smoothieProvider: smoothieOnSale[index][4],
        );
      },
    );
  }
}
