import 'package:dartz/dartz.dart';
import 'package:test_app/Home/domain/entitis/category.dart';
import 'package:test_app/Home/domain/repository/base_home_repository.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/base_usecase.dart';

class GetCategoryUseCase extends BaseUsecase<List<Category>, NoParameter> {
  final BaseHomeRepository baseHomeRepository;

  GetCategoryUseCase({required this.baseHomeRepository});

  @override
  Future<Either<Failure, List<Category>>> call(NoParameter parameter) async {
    return await baseHomeRepository.getCategory();
  }
}
