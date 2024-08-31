class Product {
  final int id;
  final String name;
  final String category;
  final String image;
  final String description; // Corrected typo
  final double price;
  late final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}
