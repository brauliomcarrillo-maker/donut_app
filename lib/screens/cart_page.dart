import 'package:flutter/material.dart';
import '../cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: AnimatedBuilder(
        animation: Cart(),
        builder: (context, _) {
          return Cart().items.isEmpty
              ? const Center(
                  child: Text(
                    "Your cart is empty",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: Cart().items.length,
                        itemBuilder: (context, index) {
                          final item = Cart().items[index];

                          return ListTile(
                            leading: Image.asset(item[3], width: 50),
                            title: Text(item[0]),
                            subtitle: Text("\$${item[1]}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                Cart().removeItem(index);
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Total: \$${Cart().totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Cart().clear();
                            },
                            child: const Text("Checkout"),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
