import 'package:equatable/equatable.dart';
import 'package:test_app/Home/domain/entitis/product_for_you.dart';

class ProductsForYouPagination extends Equatable {
  final int currentPage;
  final String? nextPageUrl;
  final int perPage;
  final List<ProductsForYou> products;
  final int total;

  const ProductsForYouPagination({
    required this.currentPage,
    required this.nextPageUrl,
    required this.perPage,
    required this.products,
    required this.total
  });

  @override
  List<Object?> get props => [currentPage, nextPageUrl, perPage, products,total];
}
