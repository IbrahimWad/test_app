import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Home/presentation/controller/home_controller.dart';
import 'package:test_app/core/services/services_locator.dart';
import 'package:test_app/core/utils/enums.dart';
import 'package:test_app/core/widget/app_color.dart';
import 'package:test_app/core/widget/product_Item_card.dart';

class ForYouGridView extends StatelessWidget {
  const ForYouGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(sl<HomeController>());

    return Obx(() {
      switch (controller.productsRequestState.value) {
        case RequestState.loading:
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: AppColors.textColor,
              ),
            ),
          );

        case RequestState.loaded:
          return SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index >= controller.products.length) {
                    if (controller.hasMoreData.value) {
                      controller.loadMoreProducts();
                    }
                    if (controller.isLoadingMore.value) {
                      return const Center(
                        child: SizedBox(
                          width: 30, // Set width for the loading indicator
                          height: 30, // Set height for the loading indicator
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            color: AppColors.textColor,
                          ),
                        ),
                      );
                    }
                    return null;
                  }
                  return ProductItemCard(
                    imageUrl: controller.products[index].image,
                    rating: '${controller.products[index].rating}',
                    price: '${controller.products[index].price}',
                  );
                },
                childCount: controller.hasMoreData.value
                    ? controller.products.length + 1
                    : controller.products.length,
              ),
            ),
          );

        case RequestState.error:
          return SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.productsMessage.value.isNotEmpty
                        ? controller.productsMessage.value
                        : 'An error occurred.',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: controller.refreshData,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
      }
    });
  }
}
