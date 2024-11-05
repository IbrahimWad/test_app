import 'package:get/get.dart';
import 'package:test_app/Home/presentation/controller/home_controller.dart';
import 'package:test_app/core/services/services_locator.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
        getPopularProductUseCase: sl(),
        getCategoryUseCase: sl(),
        getSlidesUseCase: sl(),
        productsForYouUseCase: sl()));
  }
}
