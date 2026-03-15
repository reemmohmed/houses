
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,

    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.hintText,
    this.iconprefix,
    this.textLable,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? hintText;
  final IconData? iconprefix;
  final String? textLable;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 2.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(textLable ?? ""),
        ),
        prefixIcon: Icon(iconprefix),
        hint: Text(hintText ?? ""),
        hintStyle: TextStyle(backgroundColor: Colors.black),
      ),
    );
  }
}
