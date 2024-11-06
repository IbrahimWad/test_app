import 'package:flutter/material.dart';
import 'package:test_app/Home/presentation/components/category_components.dart';
import 'package:test_app/Home/presentation/components/for_you_components.dart';
import 'package:test_app/Home/presentation/components/populer_component.dart'
    as populer;
import 'package:test_app/Home/presentation/components/shope_compnents.dart';
import 'package:test_app/Home/presentation/components/sliders_components.dart';
import 'package:test_app/core/widget/app_color.dart';
import 'package:test_app/core/widget/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/icon.png',
          width: 72,
          height: 24,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 36),
                const SizedBox(
                  height: 172,
                  child: SlidersComponents(),
                ),
                const SizedBox(height: 16),
                const ShopesComponents(),
                const SizedBox(height: 16),
                const CategoryComponents(),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: rowMethod('الاكثر طلبا', 'عرض الكل'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),

          // Popular component
          SliverToBoxAdapter(
            child: const populer.PopulerComponent(),
          ),

          // For You header
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: rowMethod('خصيصا لك!', 'عرض الكل'),
            ),
          ),

          // ForYouGridView
          const ForYouGridView(),
        ],
      ),
    );
  }

  static Row rowMethod(String text, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColors.borderColor,
        ),
        CustomText(
          text: text2,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.borderColor,
        ),
      ],
    );
  }
}
