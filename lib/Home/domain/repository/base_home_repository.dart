import 'package:dartz/dartz.dart';
import 'package:test_app/Home/domain/entitis/category.dart';
import 'package:test_app/Home/domain/entitis/page_nation.dart';
import 'package:test_app/Home/domain/entitis/popular_product.dart';
import 'package:test_app/Home/domain/entitis/slides.dart';
import 'package:test_app/Home/domain/usecase/product_for_you_use_case.dart';

import '../../../core/error/failure.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<Slides>>> getSlides();
  Future<Either<Failure, List<Category>>> getCategory();
  Future<Either<Failure, List<PopularProduct>>> getPopularProduct();
  Future<Either<Failure, ProductsForYouPagination>> getProductsForYou(
      PageNumber parameter);
}
