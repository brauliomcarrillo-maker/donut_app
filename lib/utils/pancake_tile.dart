import 'package:flutter/material.dart';
import 'package:donut_app/cart.dart';

class PancakeTile extends StatelessWidget {
  const PancakeTile({
    super.key,
    required this.pancakeFlavor,
    required this.pancakePrice,
    required this.pancakeColor,
    required this.pancakeImagePath,
    required this.pancakeProvider,
  });

  final String pancakeFlavor;
  final String pancakePrice;
  final dynamic pancakeColor;
  final String pancakeImagePath;
  final String pancakeProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pancakeColor[100],
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
                    color: pancakeColor[200],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$pancakePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pancakeColor[800],
                    ),
                  ),
                ),
              ],
            ),

            // Imagen
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(pancakeImagePath),
            ),

            // Nombre
            Text(
              pancakeFlavor,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            const SizedBox(height: 4),

            // Proveedor
            Text(pancakeProvider, style: TextStyle(color: Colors.grey[600])),

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
                        pancakeFlavor,
                        pancakePrice,
                        pancakeColor,
                        pancakeImagePath,
                        pancakeProvider,
                      ]);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$pancakeFlavor added to cart"),
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
