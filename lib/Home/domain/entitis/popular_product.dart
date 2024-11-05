import 'package:equatable/equatable.dart';

class PopularProduct extends Equatable {
  final int id;
  final String name;
  final int rating;
  final String image;
  final int price;

  const PopularProduct(
      {required this.id,
      required this.name,
      required this.rating,
      required this.price,
      required this.image});

  @override
  List<Object?> get props => [id, name, rating, image, price];
}
