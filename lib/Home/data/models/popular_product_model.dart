import 'package:test_app/Home/domain/entitis/popular_product.dart';

class PopularProductModel extends PopularProduct {
  const PopularProductModel(
      {required super.id,
      required super.name,
      required super.rating,
      required super.image,
      required super.price});

  factory PopularProductModel.fromJson(Map<String, dynamic> json) =>
      PopularProductModel(
          id: json['id'],
          name: json['name'],
          rating: json['rating'],
          image: json['image'],
          price: json['price']);
}
