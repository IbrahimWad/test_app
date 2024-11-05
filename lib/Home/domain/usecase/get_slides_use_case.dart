import 'package:dartz/dartz.dart';
import 'package:test_app/Home/domain/entitis/slides.dart';
import 'package:test_app/Home/domain/repository/base_home_repository.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/base_usecase.dart';

class GetSlidesUseCase extends BaseUsecase<List<Slides>, NoParameter> {
  final BaseHomeRepository baseHomeRepository;

  GetSlidesUseCase({required this.baseHomeRepository});

  @override
  Future<Either<Failure, List<Slides>>> call(NoParameter parameter) async {
    return await baseHomeRepository.getSlides();
  }
}
