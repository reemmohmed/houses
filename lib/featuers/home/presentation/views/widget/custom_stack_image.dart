import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomStackImage extends StatelessWidget {
  const CustomStackImage({
    super.key,

    //  required this.title,
    //  required this.description,
    this.onTap,
  });

  // final String title;
  // final String description;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://i.pravatar.cc/300",
                width: double.infinity,
                height: size.width * 0.6,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    // الصورة خلصت تحميلها -> ارجع Stack مع النص
                    return Stack(
                      children: [
                        child,
                        Positioned(
                          left: 16,
                          bottom: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  shadows: const [
                                    Shadow(color: Colors.black, blurRadius: 4),
                                  ],
                                ),
                              ),
                              Text(
                                "description",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  // أثناء التحميل، اعرض Shimmer
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: 220,
                      color: Colors.grey[300],
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 220,
                  color: Colors.grey,
                  child: const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
