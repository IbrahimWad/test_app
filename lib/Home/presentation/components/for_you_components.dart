import 'package:flutter/material.dart';
import 'package:test_app/core/widget/product_item_card.dart';

class ForYouGridView extends StatelessWidget {
  const ForYouGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> localProducts = [
      {
        'image': 'assets/images/product.jpg',
        'rating': '3.9',
        'price': '29000',
        'name': 'احمر شفاه سمارت احمر ش...',
      },
      {
        'image': 'assets/images/product.jpg',
        'rating': '3.9',
        'price': '29000',
        'name': 'احمر شفاه سمارت احمر ش...',
      },
      {
        'image': 'assets/images/product.jpg',
        'rating': '3.9',
        'price': '29000',
        'name': 'احمر شفاه سمارت احمر ش...',
      },
      {
        'image': 'assets/images/product.jpg',
        'rating': '3.9',
        'price': '29000',
        'name': 'احمر شفاه سمارت احمر ش...',
      },
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.70, // Adjusted for specific aspect ratio
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = localProducts[index];
            return ProductItemCard(
              name: product['name'],
              imageUrl: product['image'],
              rating: product['rating'],
              price: product['price'],
              onFavoriteTapped: () {
                // Handle favorite button tap
              },
            );
          },
          childCount: localProducts.length,
        ),
      ),
    );
  }
}
