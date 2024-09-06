import 'package:flutter/material.dart';
import 'package:whitematrix/cart.dart';


class CartScreen extends StatelessWidget {
  final Cart cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final product = cart.items[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Rs. ${product.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      cart.removeProduct(product);
                    },
                  ),
                );
              },
            ),
          ),
          Text('Total: Rs. ${cart.totalPrice.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: () {
              // Proceed to checkout
            },
            child: Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}
