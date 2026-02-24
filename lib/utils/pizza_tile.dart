import 'package:flutter/material.dart';
import 'package:donut_app/cart.dart';

class PizzaTile extends StatelessWidget {
  const PizzaTile({
    super.key,
    required this.pizzaFlavor,
    required this.pizzaPrice,
    required this.pizzaColor,
    required this.pizzaImagePath,
    required this.pizzaProvider,
  });

  final String pizzaFlavor;
  final String pizzaPrice;
  final dynamic pizzaColor;
  final String pizzaImagePath;
  final String pizzaProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pizzaColor[100],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            // Etiqueta del precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: pizzaColor[200],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$pizzaPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pizzaColor[800],
                    ),
                  ),
                ),
              ],
            ),

            // Imagen
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(pizzaImagePath),
            ),

            // Nombre
            Text(
              pizzaFlavor,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            const SizedBox(height: 4),

            // Proveedor
            Text(pizzaProvider, style: TextStyle(color: Colors.grey[600])),

            const SizedBox(height: 8),

            // Fila de acciones
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border, color: Colors.pink[400]),

                  // 🔥 BOTÓN ADD FUNCIONAL
                  GestureDetector(
                    onTap: () {
                      Cart().addItem([
                        pizzaFlavor,
                        pizzaPrice,
                        pizzaColor,
                        pizzaImagePath,
                        pizzaProvider,
                      ]);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$pizzaFlavor added to cart"),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
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
