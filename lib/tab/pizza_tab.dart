import 'package:donut_app/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  PizzaTab({super.key});

  //List of donuts
  final List pizzaOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    ['Pizza de algo', '100', Colors.brown, "lib/images/pizza1.png", 'Messinas'],
    [
      'Pizza de peperoni',
      '89',
      Colors.red,
      "lib/images/pizza2.png",
      'Super Pizza',
    ],
    ['Pizza chicago', '95', Colors.blue, "lib/images/pizza3.png", "Domino´s"],
    [
      'Pizza tradicional',
      '70',
      Colors.purple,
      "lib/images/pizza4.png",
      'Pizzería Nuñez Che',
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
      itemCount: pizzaOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
        return PizzaTile(
          pizzaFlavor: pizzaOnSale[index][0],
          pizzaPrice: pizzaOnSale[index][1],
          pizzaColor: pizzaOnSale[index][2],
          pizzaImagePath: pizzaOnSale[index][3],
          pizzaProvider: pizzaOnSale[index][4],
        );
      },
    );
  }
}
