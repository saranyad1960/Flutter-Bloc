import '../model/productdetail_model.dart';

class ProductRepository {
  Future<Product> fetchProduct() async {
    return Future.delayed(Duration(seconds: 1), () {
      return Product(
        name: 'Nike Air Force',
        price: 50.00,
        rating: 4.5,
        reviewCount: 15,
        description: 'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
        colors: ['Black', 'Amber', 'White'],
        sizes: ['S', 'M', 'L', 'XL'],
      );
    });
  }
}

