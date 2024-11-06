import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Home/presentation/controller/home_controller.dart';
import 'package:test_app/core/services/services_locator.dart';
import 'package:test_app/core/widget/app_color.dart';
import 'package:test_app/core/widget/custom_text.dart';

class CategoryComponents extends StatelessWidget {
  const CategoryComponents({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the instance of CategoryController using GetX
    final HomeController controller = Get.put(sl<HomeController>());

    return Obx(() {
      print(
          'CategoryComponents build, selectedType: ${controller.selectedType}');
      return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            final bool isSelected = index + 1 == controller.selectedType;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: _buildCategoryButton(
                category.name,
                isSelected,
                () => controller.selectCategory(index + 1),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildCategoryButton(
    String name,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.borderColor.withOpacity(0.6) // 60% opacity for selected
            : Colors.white, // White background for unselected
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected
              ? AppColors.borderColor
                  .withOpacity(0.8) // 80% opacity for selected
              : Colors.white, // White border for unselected
          width: 1,
        ),
        boxShadow: !isSelected
            ? [
                BoxShadow(
                  color: AppColors.borderColor.withOpacity(0.35),
                  offset: Offset(0, 0), // x = 0, y = 0
                  blurRadius: 10, // Adjust for desired shadow softness
                ),
              ]
            : [],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: CustomText(
            color: isSelected ? Colors.white : AppColors.borderColor,
            text: name,
            fontSize: 16,
            alignment: Alignment.center,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class CategoryController extends GetxController {}

class CategoryModel {
  final String name;

  CategoryModel({
    required this.name,
  });
}
