import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Home/presentation/controller/home_controller.dart';
import 'package:test_app/core/services/services_locator.dart';
import 'package:test_app/core/widget/app_color.dart';
import 'package:test_app/core/widget/custom_text.dart';

class ShopesComponents extends StatelessWidget {
  const ShopesComponents({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the instance of ShopesController using GetX
    final HomeController controller = Get.put(sl<HomeController>());

    return Obx(() {
      print('ShopesComponents build, selectedShop: ${controller.selectedShop}');
      return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.shopes.length,
          itemBuilder: (context, index) {
            final shop = controller.shopes[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _buildShopButton(
                shop.name,
                shop.imagePath,
                () => controller.selectShop(index + 1),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildShopButton(
    String name,
    String imagePath,
    VoidCallback onTap,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.white, // Keep background white
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.borderColor, // Border color remains the same
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(
                  imagePath,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 8),
              CustomText(
                color: AppColors.borderColor,
                text: name,
                fontSize: 16,
                alignment: Alignment.center,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ShopModel {
  final String name;
  final String imagePath;

  ShopModel({
    required this.name,
    required this.imagePath,
  });
}
