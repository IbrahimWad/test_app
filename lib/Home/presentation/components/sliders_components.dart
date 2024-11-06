import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/widget/app_color.dart';

class SlidersComponents extends StatelessWidget {
  const SlidersComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final RxInt currentIndex = 0.obs;

    // Static list of asset image paths
    final List<String> localSlides = [
      'assets/images/slides.png',
      'assets/images/slides.png',
      'assets/images/slides.png',
      // Add more asset paths as needed
    ];

    return Obx(() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: 200.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                currentIndex.value = index; // Update the current index
              },
            ),
            items: localSlides.map((slidePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width, // Full width
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        slidePath,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover, // Cover to fill the entire width
                        height: 200.0,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(localSlides.length, (index) {
                final int distance = (currentIndex.value - index).abs();
                final Color dotColor = AppColors.backgroundColor.withOpacity(
                  (1 - (0.2 * distance)).clamp(0, 1),
                );

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dotColor,
                  ),
                );
              }),
            ),
          ),
        ],
      );
    });
  }
}
