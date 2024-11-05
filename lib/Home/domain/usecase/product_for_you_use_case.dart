import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/Home/domain/entitis/page_nation.dart';
import 'package:test_app/Home/domain/repository/base_home_repository.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/base_usecase.dart';

class ProductsForYouUseCase
    extends BaseUsecase<ProductsForYouPagination, PageNumber> {
  final BaseHomeRepository baseHomeRepository;

  ProductsForYouUseCase({required this.baseHomeRepository});
  @override
  Future<Either<Failure, ProductsForYouPagination>> call(parameter) async {
    return await baseHomeRepository.getProductsForYou(parameter);
  }
}

class PageNumber extends Equatable {
  final int page;

  const PageNumber({required this.page});

  @override
  List<Object?> get props => [page];
}
