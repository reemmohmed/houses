
// Carousel الصور الصغيرة
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;
  final int currentIndex;
  final Function(int) onTap;
  const ImageCarousel({
    required this.images,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: currentIndex == index
                      ? Colors.blueGrey
                      : Colors.grey.shade300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(images[index], fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
