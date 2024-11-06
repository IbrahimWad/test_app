import 'package:flutter/material.dart';
import 'package:test_app/core/widget/product_item_card.dart';

class PopulerComponent extends StatelessWidget {
  const PopulerComponent({super.key});

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.70, // Adjusted for the card's aspect ratio
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
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
          ),
        ],
      ),
    );
  }
}
