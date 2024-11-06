import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_app/Home/domain/entitis/category.dart';
import 'package:test_app/Home/domain/entitis/popular_product.dart';
import 'package:test_app/Home/domain/entitis/product_for_you.dart';
import 'package:test_app/Home/domain/entitis/slides.dart';
import 'package:test_app/Home/domain/usecase/get_catefory_usecase.dart';
import 'package:test_app/Home/domain/usecase/get_popular_product_use_case.dart';
import 'package:test_app/Home/domain/usecase/get_slides_use_case.dart';
import 'package:test_app/Home/domain/usecase/product_for_you_use_case.dart';
import 'package:test_app/Home/presentation/components/category_components.dart';
import 'package:test_app/Home/presentation/components/shope_compnents.dart';
import 'package:test_app/core/usecases/base_usecase.dart';
import 'package:test_app/core/utils/enums.dart';

class HomeController extends GetxController {
  final GetPopularProductUseCase getPopularProductUseCase;
  final GetCategoryUseCase getCategoryUseCase;
  final GetSlidesUseCase getSlidesUseCase;
  final ProductsForYouUseCase productsForYouUseCase;

  HomeController({
    required this.getPopularProductUseCase,
    required this.getCategoryUseCase,
    required this.getSlidesUseCase,
    required this.productsForYouUseCase,
  });

  final RxBool isLoadingMore = false.obs;
  final RxBool hasMoreData = true.obs;
  int currentPage = 1;

  // Scroll controller
  late ScrollController scrollController;
  // Data states
  final RxList<Slides> slides = <Slides>[].obs;
  // final RxList<Category> categories = <Category>[].obs;
  final RxList<PopularProduct> popularProducts = <PopularProduct>[].obs;
  final RxList<ProductsForYou> products = <ProductsForYou>[].obs;

  // Message states
  final RxString slideMessage = ''.obs;
  final RxString categoryMessage = ''.obs;
  final RxString popularMessage = ''.obs;
  final RxString productsMessage = ''.obs;

  // Request states
  final Rx<RequestState> slidesRequestState = RequestState.loading.obs;
  final Rx<RequestState> categoriesRequestState = RequestState.loading.obs;
  final Rx<RequestState> popularRequestState = RequestState.loading.obs;
  final Rx<RequestState> productsRequestState = RequestState.loading.obs;

  bool isLoading = false; // Track loading state
  int total = 0; // Total number of products (you should initialize this)

  // Selected category type
  //var selectedType = 1.obs; // Default to 1

  // void focusType(int type) {
  //   selectedType.value = type; // Update selected type
  // }

  // Observable properties
  var totalPages = 0; // Total pages available

  // Getter for hasMorePages
  bool get hasMorePages => currentPage < totalPages;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    getInitialData();
  }

  Future<void> getInitialData() async {
    await Future.wait([
      //   getSlides(),
      //   getCategory(),
      //   getPopularProduct(),
      //   getProductsForYou(1), // Start with page 1
    ]);
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      // Pre-fetch threshold
      if (!isLoadingMore.value && hasMoreData.value) {
        loadMoreProducts();
      }
    }
  }

  Future<void> getSlides() async {
    final result = await getSlidesUseCase(const NoParameter());
    result.fold((l) {
      slidesRequestState(RequestState.error);
      slideMessage('خطـــأ غير متوقع'); // Unexpected error
    }, (r) {
      slides.assignAll(r);
      slidesRequestState(RequestState.loaded);
    });
  }

  // Future<void> getCategory() async {
  //   final result = await getCategoryUseCase(const NoParameter());
  //   result.fold((l) {
  //     categoriesRequestState(RequestState.error);
  //     categoryMessage('خطـــأ غير متوقع'); // Unexpected error
  //   }, (r) {
  //     categories.assignAll(r);
  //     categoriesRequestState(RequestState.loaded);
  //   });
  // }

  Future<void> getPopularProduct() async {
    final result = await getPopularProductUseCase(const NoParameter());
    result.fold((l) {
      popularRequestState(RequestState.error);
      popularMessage('خطـــأ غير متوقع'); // Unexpected error
    }, (r) {
      popularProducts.assignAll(r);
      popularRequestState(RequestState.loaded);
    });
  }

  Future<void> getProductsForYou(int pageNumber) async {
    try {
      if (pageNumber == 1) {
        productsRequestState(RequestState.loading);
      }

      final result = await productsForYouUseCase(PageNumber(page: pageNumber));

      result.fold(
        (failure) {
          productsRequestState(RequestState.error);
          productsMessage(failure.message);
        },
        (data) {
          if (pageNumber == 1) {
            products.clear();
          }

          products.addAll(data.products);
          hasMoreData.value = data.nextPageUrl != null;

          if (pageNumber == 1) {
            productsRequestState(RequestState.loaded);
          }
        },
      );
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future<void> loadMoreProducts() async {
    if (!isLoadingMore.value && hasMoreData.value) {
      isLoadingMore.value = true;
      currentPage++;
      await getProductsForYou(currentPage);
    }
  }

  Future<void> refreshData() async {
    currentPage = 1;
    hasMoreData.value = true;
    await getProductsForYou(1);
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  final _selectedShop = 1.obs;
  int get selectedShop => _selectedShop.value;

  final _shopes = [
    ShopModel(name: 'ماك', imagePath: 'assets/images/mac.jpg'),
    ShopModel(name: 'لوريال باريس', imagePath: 'assets/images/ss.png'),
    ShopModel(name: 'ماك', imagePath: 'assets/images/mac.jpg'),
    ShopModel(name: 'لوريال باريس', imagePath: 'assets/images/ss.png'),
  ].obs;

  List<ShopModel> get shopes => _shopes.toList();

  void selectShop(int shop) {
    print('selectShop called, shop: $shop');
    _selectedShop.value = shop;
  }

  final _selectedType = 1.obs;
  int get selectedType => _selectedType.value;

  final _categories = [
    CategoryModel(name: 'عطور'),
    CategoryModel(name: 'العناية بالشعر'),
    CategoryModel(name: 'الفساتين'),
    CategoryModel(name: 'الكل'),
  ].obs;

  List<CategoryModel> get categories => _categories.toList();

  void selectCategory(int type) {
    print('selectCategory called, type: $type');
    _selectedType.value = type;
  }
}
