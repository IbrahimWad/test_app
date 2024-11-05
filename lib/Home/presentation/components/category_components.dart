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
    // Get the instance of HomeController using GetX
    final HomeController controller = Get.put(sl<HomeController>());

    return Obx(() {
      // Ensure selectedType is of type int
      int selectedType = controller.selectedType.value; // Default to 0 if null

      return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            // Check if the current index is the selected type
            bool isSelected = index + 1 == selectedType;

            return TypeMethod(
              name: controller.categories[index].name,
              color: isSelected ? Colors.white : AppColors.secondTextColor,
              containerColor:
                  isSelected ? AppColors.textColor : Colors.transparent,
              onTap: () {
                // Call the focusType method to update the selected category
                controller.focusType(index + 1);
              },
            );
          },
        ),
      );
    });
  }

  // Widget to display each category button
  Widget TypeMethod({
    required String name,
    required Color color,
    required Color containerColor,
    required VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: ShapeDecoration(
        color: containerColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: color),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap, // Handle tap event
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: CustomText(
            color: color,
            text: name,
            fontSize: 24,
            alignment: Alignment.center,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
