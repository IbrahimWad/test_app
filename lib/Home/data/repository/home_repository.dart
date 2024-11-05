import 'package:dartz/dartz.dart';
import 'package:test_app/Home/data/datasource/home_remot_data_source.dart';
import 'package:test_app/Home/domain/entitis/category.dart';
import 'package:test_app/Home/domain/entitis/page_nation.dart';
import 'package:test_app/Home/domain/entitis/popular_product.dart';
import 'package:test_app/Home/domain/entitis/slides.dart';
import 'package:test_app/Home/domain/repository/base_home_repository.dart';
import 'package:test_app/Home/domain/usecase/product_for_you_use_case.dart';
import 'package:test_app/core/error/exceptions.dart';
import 'package:test_app/core/error/failure.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository({required this.baseHomeRemoteDataSource});

  @override
  Future<Either<Failure, List<Category>>> getCategory() async {
    try {
      final result = await baseHomeRemoteDataSource.getCategory();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<PopularProduct>>> getPopularProduct() async {
    try {
      final result = await baseHomeRemoteDataSource.getPopularProduct();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ProductsForYouPagination>> getProductsForYou(
      PageNumber parameter) async {
    try {
      final result =
          await baseHomeRemoteDataSource.getProductsForYou(parameter);

          
      return Right(result); // result should be ProductsForYouPaginationModel
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Slides>>> getSlides() async {
    try {
      final result = await baseHomeRemoteDataSource.getSlides();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
