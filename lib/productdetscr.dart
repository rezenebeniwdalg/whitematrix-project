// screens/product_detail.dart
import 'package:flutter/material.dart';
import 'package:whitematrix/model.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          Text(product.name),
          Text('\$${product.price.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: () {
              // Add to cart functionality
            },
            child: Text('Add to Cart'),
          ),
          ElevatedButton(
            onPressed: () {
              // Buy now functionality
            },
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}
