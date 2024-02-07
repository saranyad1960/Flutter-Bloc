class Product {
  final String name;
  final double price;
  final double rating;
  final int reviewCount;
  final String description;
  final List<String> colors;
  final List<String> sizes;

  Product({
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.colors,
    required this.sizes,
  });
}