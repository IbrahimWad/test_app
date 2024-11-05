import 'package:test_app/Home/data/models/product_for_you_model.dart';
import 'package:test_app/Home/domain/entitis/page_nation.dart';

class ProductsForYouPaginationModel extends ProductsForYouPagination {
  const ProductsForYouPaginationModel({
    required super.currentPage,
    required super.nextPageUrl,
    required super.perPage,
    required super.products,
    required super.total,
  });

  factory ProductsForYouPaginationModel.fromJson(Map<String, dynamic> json) {
    return ProductsForYouPaginationModel(
      currentPage: json['current_page'] is int
          ? json['current_page']
          : int.tryParse(json['current_page'].toString()) ??
              1, // Safely parse as int
      nextPageUrl: json['next_page_url'] as String?,
      perPage: json['per_page'] is int
          ? json['per_page']
          : int.tryParse(json['per_page'].toString()) ??
              10, // Safely parse as int
      total: json['total'],
      products: List<ProductsForYouModel>.from(
        (json['data'] as List).map((x) => ProductsForYouModel.fromJson(x)),
      ),
    );
  }
}
