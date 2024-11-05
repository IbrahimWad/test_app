import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Home/presentation/controller/home_controller.dart';
import 'package:test_app/core/services/services_locator.dart';
import 'package:test_app/core/utils/enums.dart';
import 'package:test_app/core/widget/app_color.dart';
import 'package:test_app/core/widget/product_Item_card.dart';

class PopulerComponent extends StatelessWidget {
  const PopulerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(sl<HomeController>());

    return SizedBox(
      height: 250,
      child: Obx(() {
        switch (controller.popularRequestState.value) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: AppColors.textColor,
              ),
            );
          case RequestState.loaded:
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.popularProducts.length,
              itemBuilder: (context, index) {
                return ProductItemCard(
                    imageUrl: controller.popularProducts[index].image,
                    rating: '${controller.popularProducts[index].rating}',
                    price: '${controller.popularProducts[index].price}');
              },
            );

          case RequestState.error:
            return SizedBox(
              height: 200, // Keep height consistent with carousel
              child: Center(
                child: Text(
                  controller.slideMessage.value.isNotEmpty
                      ? controller.slideMessage.value
                      : 'An error occurred.',
                  style: const TextStyle(color: Colors.red), // Optional styling
                ),
              ),
            );

          default:
            return const SizedBox
                .shrink(); // Return empty container if no match
        }
      }),
    );
  }
}
