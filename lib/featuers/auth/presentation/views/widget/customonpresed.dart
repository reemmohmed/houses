import 'package:flutter/material.dart';
import 'package:houses/core/titel_text_widget.dart';

class CustomOnpresed extends StatelessWidget {
  const CustomOnpresed({super.key, required this.textContaner, this.onTap});
  final String textContaner;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: Center(child: TitelTextWidget(text: textContaner)),
      ),
    );
  }
}
