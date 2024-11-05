import 'package:get_it/get_it.dart';
import 'package:test_app/Home/data/datasource/home_remot_data_source.dart';
import 'package:test_app/Home/data/repository/home_repository.dart';
import 'package:test_app/Home/domain/repository/base_home_repository.dart';
import 'package:test_app/Home/domain/usecase/get_catefory_usecase.dart';
import 'package:test_app/Home/domain/usecase/get_popular_product_use_case.dart';
import 'package:test_app/Home/domain/usecase/get_slides_use_case.dart';
import 'package:test_app/Home/domain/usecase/product_for_you_use_case.dart';
import 'package:test_app/Home/presentation/controller/home_controller.dart';

final sl = GetIt.instance;

class ServicesLocator {
  init() {
    sl.registerFactory(() => HomeController(
        getPopularProductUseCase: sl(),
        getCategoryUseCase: sl(),
        getSlidesUseCase: sl(),
        productsForYouUseCase: sl()));

    sl.registerLazySingleton(
        () => GetPopularProductUseCase(baseHomeRepository: sl()));
    sl.registerLazySingleton(
        () => GetCategoryUseCase(baseHomeRepository: sl()));
    sl.registerLazySingleton(() => GetSlidesUseCase(baseHomeRepository: sl()));
    sl.registerLazySingleton(
        () => ProductsForYouUseCase(baseHomeRepository: sl()));

    sl.registerLazySingleton<BaseHomeRepository>(
        () => HomeRepository(baseHomeRemoteDataSource: sl()));
    //// Data Source
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource());
  }
}
