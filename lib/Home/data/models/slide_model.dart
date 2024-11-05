import 'package:test_app/Home/domain/entitis/slides.dart';

class SlideModel extends Slides {
  const SlideModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.brandName});

  factory SlideModel.fromJson(Map<String, dynamic> json) => SlideModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        brandName: json['brand_name'],
      );
}
