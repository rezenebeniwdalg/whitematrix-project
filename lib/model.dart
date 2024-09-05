// models/product.dart
class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}
// data/products.dart
// ignore: unused_import


final List<Product> products = List.generate(
  20,
  (index) => Product(
    name: 'Product $index',
    price: (index + 1) * 10.0,
    imageUrl: 'https://via.placeholder.com/150',
  ),
);
