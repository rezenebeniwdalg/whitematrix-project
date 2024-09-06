import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:whitematrix/cart.dart';
import 'package:whitematrix/cartscr.dart';
import 'package:whitematrix/model.dart';


class ScratchCardScreen extends StatelessWidget {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    final freeProduct = products[0]; // Pick a free product

    return Scaffold(
      appBar: AppBar(title: Text('Scratch & Win')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Scratcher(
              brushSize: 50,
              threshold: 50,
              color: Colors.grey,
              onChange: (value) {},
              onThreshold: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('You won a free product!'),
                ));
              },
              child: Container(
                height: 300,
                width: 300,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Congratulations!\nYou won ${freeProduct.name}\nfor Rs. 0!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                cart.addProduct(freeProduct);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
