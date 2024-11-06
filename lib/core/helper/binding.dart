import 'package:get/get.dart';
import 'package:test_app/Home/presentation/components/category_components.dart';
import 'package:test_app/Home/presentation/components/shope_compnents.dart';
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
    Get.lazyPut(() => CategoryController());
  }
}
