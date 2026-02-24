import 'package:flutter/material.dart';
import 'package:donut_app/cart.dart';

class SmoothieTile extends StatelessWidget {
  const SmoothieTile({
    super.key,
    required this.smoothieFlavor,
    required this.smoothiePrice,
    required this.smoothieColor,
    required this.smoothieImagePath,
    required this.smoothieProvider,
  });

  final String smoothieFlavor;
  final String smoothiePrice;
  final dynamic smoothieColor;
  final String smoothieImagePath;
  final String smoothieProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: smoothieColor[100],
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
                    color: smoothieColor[200],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$smoothiePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: smoothieColor[800],
                    ),
                  ),
                ),
              ],
            ),

            // Imagen
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(smoothieImagePath),
            ),

            // Nombre
            Text(
              smoothieFlavor,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            const SizedBox(height: 4),

            // Proveedor
            Text(smoothieProvider, style: TextStyle(color: Colors.grey[600])),

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
                        smoothieFlavor,
                        smoothiePrice,
                        smoothieColor,
                        smoothieImagePath,
                        smoothieProvider,
                      ]);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$smoothieFlavor added to cart"),
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
