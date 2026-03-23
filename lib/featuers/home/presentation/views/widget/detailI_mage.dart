// صورة كبيرة مع shimmer
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailImage extends StatelessWidget {
  final String imageUrl;
  final Size size;
  const DetailImage({required this.imageUrl, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: kIsWeb ? size.width * 0.6 : size.width * 0.5,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: double.infinity,
              height: size.width * 0.6,
              color: Colors.grey[300],
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          width: double.infinity,
          height: size.width * 0.7,
          color: Colors.grey,
          child: const Icon(Icons.error, color: Colors.red),
        ),
      ),
    );
  }
}
