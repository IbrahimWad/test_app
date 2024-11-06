import 'package:flutter/material.dart';
import 'package:test_app/core/widget/app_color.dart';
import 'package:test_app/core/widget/custom_text.dart';

class ProductItemCard extends StatelessWidget {
  final String imageUrl; // This will now refer to a local asset path
  final String name;
  final String rating;
  final String price;
  final String currency;
  final VoidCallback? onFavoriteTapped;

  const ProductItemCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.price,
    this.currency = 'د.ع',
    this.onFavoriteTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      height: 236,
      width: 170,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(
        //   width: 0,
        //   color: AppColors.borderColor.withOpacity(0.4),
        // ),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderColor.withOpacity(0.35),
            offset: Offset(0, 0), // x = 0, y = 0
            blurRadius: 10, // Adjust for desired shadow softness
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  height: 168,
                  width: 170,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 13,
                right: 13,
                child: Icon(
                  Icons.favorite,
                  color: AppColors.redColor,
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CustomText(
              text: name,
              color: AppColors.borderColor,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: 'DIQ',
                          color: AppColors.secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          text: ' 29000',
                          color: AppColors.secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'DIQ',
                          color: AppColors.grayColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                        // const SizedBox(width: 3),
                        CustomText(
                          text: ' 29000',
                          color: AppColors.grayColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.secondaryColor,
                    ),
                    CustomText(
                      text: '4.5',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
