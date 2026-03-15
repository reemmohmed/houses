
import 'package:flutter/material.dart';
import 'package:houses/core/subtitel_text_widget.dart';
import 'package:houses/featuers/home/presentation/data/models/home_model.dart';
import 'package:shimmer/shimmer.dart';

class CustomStacImage extends StatelessWidget {
  const CustomStacImage({super.key, this.onTap, 
  
  });
  final void Function()? onTap;
  // final HomeModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
              "https://i.pravatar.cc/300",
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey,
                    child: const Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
          ),

          // ClipRRect(
          //   borderRadius: BorderRadiusGeometry.circular(16),
          //   child: SizedBox(
          //     height: 200, // تحدد ارتفاع مناسب
          //     width: double.infinity,
          //     child: Image.network(
          //       product.imageUrl ?? "https://i.pravatar.cc/300",
          //       fit: BoxFit.cover,
          //       width: double.infinity,
          //     ),
          //   ),
          // ),
          Positioned(
            left: 20,
            top: 100,
            bottom: 40,
            child: Text(
               "Titel",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 40,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                   "Title",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SubtitelTextWidget(
                  text: "Description",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
