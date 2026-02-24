import 'package:flutter/material.dart';
import 'package:donut_app/cart.dart';

class BurgerTile extends StatelessWidget {
  const BurgerTile({
    super.key,
    required this.burgerFlavor,
    required this.burgerPrice,
    required this.burgerColor,
    required this.burgerImagePath,
    required this.burgerProvider,
    required this.onAdd,
  });

  final String burgerFlavor;
  final String burgerPrice;
  final dynamic burgerColor;
  final String burgerImagePath;
  final String burgerProvider;

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: burgerColor[100],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            // etiqueta del precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: burgerColor[200],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$burgerPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: burgerColor[800],
                    ),
                  ),
                ),
              ],
            ),

            // imagen
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(burgerImagePath),
            ),

            // nombre
            Text(
              burgerFlavor,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            const SizedBox(height: 4),

            // proveedor
            Text(burgerProvider, style: TextStyle(color: Colors.grey[600])),

            const SizedBox(height: 8),

            // fila de acciones
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border, color: Colors.pink[400]),

                  // Add funcional
                  GestureDetector(
                    onTap: () {
                      Cart().addItem([
                        burgerFlavor,
                        burgerPrice,
                        burgerColor,
                        burgerImagePath,
                        burgerProvider,
                      ]);

                      onAdd(); // si aún lo tienes (puedes quitarlo después)

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$burgerFlavor added to cart"),
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
