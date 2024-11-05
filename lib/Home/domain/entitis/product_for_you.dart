import 'package:equatable/equatable.dart';

class ProductsForYou extends Equatable {
  final int id;
  final String name;
  final String image;
  final int price;
  final double rating;

  const ProductsForYou(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.rating});

  @override
  List<Object?> get props => [id, name, image, price, rating];
}
