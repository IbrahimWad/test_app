import 'package:test_app/Home/domain/entitis/product_for_you.dart';

class ProductsForYouModel extends ProductsForYou {
  const ProductsForYouModel({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
    required super.rating,
  });

  factory ProductsForYouModel.fromJson(Map<String, dynamic> json) =>
      ProductsForYouModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        rating: json['evaluation'], // Updated to use 'evaluation' as the rating
      );
}
