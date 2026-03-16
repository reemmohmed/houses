
// معلومات المنتج والزر
import 'package:flutter/material.dart';
import 'package:houses/core/titel_text_widget.dart';

class ProductInfo extends StatelessWidget {
  final Size size;
  const ProductInfo({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Amazing Product Title",
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "This is a detailed description of the product. It explains features, quality, and why you should get it. Perfect for showcasing amazing products in your app!",
          style: TextStyle(fontSize: size.width * 0.04, color: Colors.black54),
        ),
        const SizedBox(height: 20),
        Text(
          "Price: 455,000 EGP",
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[800],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.blueGrey[800],
            ),
            child: TitelTextWidget(
              text: "Contact / Book Now",
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
