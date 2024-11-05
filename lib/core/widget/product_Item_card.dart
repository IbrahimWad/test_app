import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductItemCard extends StatelessWidget {
  final String imageUrl;
  final String rating;
  final String price;
  final String currency;
  final VoidCallback? onFavoriteTapped;

  const ProductItemCard({
    Key? key,
    required this.imageUrl,
    required this.rating,
    required this.price,
    this.currency = 'د.ع',
    this.onFavoriteTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        height: 200, // Set a fixed height for each card
        width: (Get.width / 2) - 16,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: GestureDetector(
                  onTap: onFavoriteTapped,
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ),
              Positioned(
                left: 8,
                bottom: 8,
                child: Row(
                  children: [
                    Text(
                      ' $rating',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 8,
                bottom: 8,
                child: Row(
                  children: [
                    Text(
                      ' $price',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      currency,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
