
import 'package:flutter/material.dart';

class AirbnbCard extends StatelessWidget {
  const AirbnbCard({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🖼 Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Image.network(
              "https://picsum.photos/600/400",
              height: size.height * .23,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// 📄 Info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Modern Villa in New Cairo",
                  style: TextStyle(
                    fontSize: size.width * .045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "4 bedrooms • Pool • Garden view",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  "EGP 3,250,000",
                  style: TextStyle(
                    fontSize: size.width * .045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
