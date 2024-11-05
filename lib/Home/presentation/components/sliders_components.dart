import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package
import 'package:test_app/Home/presentation/controller/home_controller.dart';
import 'package:test_app/core/services/services_locator.dart';
import 'package:test_app/core/utils/enums.dart';
import 'package:test_app/core/widget/app_color.dart';

class SlidersComponents extends StatelessWidget {
  const SlidersComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(sl<HomeController>());
    final RxInt currentIndex = 0.obs;

    return Obx(() {
      switch (controller.slidesRequestState.value) {
        case RequestState.loading:
          return const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: AppColors.textColor,
              ),
            ),
          );
        case RequestState.loaded:
          return Stack(
            alignment:
                Alignment.bottomCenter, // Align dots to the center bottom
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0, // Height for the carousel
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    currentIndex.value = index; // Update the current index
                  },
                ),
                items: controller.slides.map((slide) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width -
                            6, // Full width minus margin (3 on each side)
                        margin: const EdgeInsets.symmetric(
                            horizontal: 3), // Margin of 3
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            children: [
                              // CachedNetworkImage with shimmer effect in the placeholder
                              CachedNetworkImage(
                                imageUrl: slide.image,
                                fit: BoxFit
                                    .cover, // Use BoxFit.cover to fill the width
                                height: 200.0, // Set height to 200
                                // Show shimmer while loading
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    color: Colors.white, // Fallback color
                                    height: 200.0, // Same height as carousel
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 10, // Adjust the position from the bottom
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(controller.slides.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex.value == index
                            ? AppColors.textColor // Active color
                            : Colors.grey, // Inactive color
                      ),
                    );
                  }),
                ),
              ),
            ],
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
          return const SizedBox.shrink(); // Return empty container if no match
      }
    });
  }
}
