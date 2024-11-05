import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/Home/data/models/category_model.dart';
import 'package:test_app/Home/data/models/page_nation_model.dart';
import 'package:test_app/Home/data/models/popular_product_model.dart';
import 'package:test_app/Home/data/models/slide_model.dart';
import 'package:test_app/Home/domain/usecase/product_for_you_use_case.dart';
import 'package:test_app/core/error/exceptions.dart';
import 'package:test_app/core/network/api_constant.dart';
import 'package:test_app/core/network/error_message_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<SlideModel>> getSlides();
  Future<List<CategoryModel>> getCategory();
  Future<List<PopularProductModel>> getPopularProduct();
  Future<ProductsForYouPaginationModel> getProductsForYou(PageNumber parameter);
  Future<dynamic> fetchJsonData(String url);
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  // Fetch raw JSON data from a URL
  @override
  Future<dynamic> fetchJsonData(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);

      return decodedData;
    } else {
      final errorData = jsonDecode(response.body);
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(errorData),
      );
    }
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    final rawData = await fetchJsonData(ApiConstant.categoryUrl);
    // Parse the raw data into a list of CategoryModel
    return List<CategoryModel>.from(
      (rawData['data'] as List).map((e) => CategoryModel.fromJson(e)),
    );
  }

  @override
  Future<List<PopularProductModel>> getPopularProduct() async {
    final rawData = await fetchJsonData(ApiConstant.popularUrl);
    // Parse the raw data into a list of PopularProductModel
    return List<PopularProductModel>.from(
      (rawData as List).map((e) => PopularProductModel.fromJson(e)),
    );
  }

  @override
  Future<ProductsForYouPaginationModel> getProductsForYou(
      PageNumber parameter) async {
    final url = ApiConstant.productForYouUrl(parameter.page); // Corrected URL
    final rawData = await fetchJsonData(url); // Fetch the raw JSON data

    // Parse the raw data into a ProductsForYouPaginationModel
    return ProductsForYouPaginationModel.fromJson(rawData);
  }

  @override
  Future<List<SlideModel>> getSlides() async {
    final rawData = await fetchJsonData(ApiConstant.slidUrl);
    // Parse the raw data into a list of SlideModel
    return List<SlideModel>.from(
      (rawData as List).map((e) => SlideModel.fromJson(e)),
    );
  }
}
