// home_screen.dart
import 'package:flutter/material.dart';
import 'package:test_app/Home/presentation/components/category_components.dart';
import 'package:test_app/Home/presentation/components/for_you_components.dart';
import 'package:test_app/Home/presentation/components/populer_component.dart';
import 'package:test_app/Home/presentation/components/sliders_components.dart';
import 'package:test_app/core/widget/app_color.dart';
import 'package:test_app/core/widget/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: CustomText(
          text: 'Test App',
          alignment: Alignment.center,
          fontSize: 24,
        ),
        centerTitle: true,
        backgroundColor: AppColors.textColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Implement your refresh logic here
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 200,
                    child: SlidersComponents(),
                  ),
                  const SizedBox(height: 10),
                  const CategoryComponents(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: rowMethod('الاكثر طلبا', 'عرض المزيد'),
                  ),
                  const PopulerComponent(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: rowMethod('خصيصا لك', 'عرض المزيد'),
                  ),
                ],
              ),
            ),
            const ForYouGridView(),
          ],
        ),
      ),
    );
  }

  Row rowMethod(String text, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: AppColors.textColor,
        ),
        CustomText(
          text: text2,
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: AppColors.textColor,
        ),
      ],
    );
  }
}

// for_you_components.dart
