import 'package:equatable/equatable.dart';

class Slides extends Equatable {
  final int id;
  final String name;
  final String image;
  final String brandName;

  const Slides(
      {required this.id,
      required this.name,
      required this.image,
      required this.brandName});

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        brandName,
      ];
}
