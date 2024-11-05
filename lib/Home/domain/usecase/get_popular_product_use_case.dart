import 'package:dartz/dartz.dart';
import 'package:test_app/Home/domain/entitis/popular_product.dart';
import 'package:test_app/Home/domain/repository/base_home_repository.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/base_usecase.dart';

class GetPopularProductUseCase
    extends BaseUsecase<List<PopularProduct>, NoParameter> {
  final BaseHomeRepository baseHomeRepository;

  GetPopularProductUseCase({required this.baseHomeRepository});

  @override
  Future<Either<Failure, List<PopularProduct>>> call(
      NoParameter parameter) async {
    return await baseHomeRepository.getPopularProduct();
  }
}
