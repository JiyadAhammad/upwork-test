import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.visble = false,
    required this.validator,
    this.onSaved,
    this.keyboardType,
    this.borderRadius = 25.0,
  });
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool visble;
  final String? Function(String?) validator;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        controller: controller,
        obscureText: visble,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontSize: 24,
          color: kwhiteText,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: kwhite,
          prefixIcon: Icon(
            prefixIcon,
            color: kbluegrey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: kwhite,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              width: 3,
              color: kwhite,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: kwhite,
            ),
          ),
          fillColor: kbluegrey,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: kwhite54,
            fontSize: 16,
            fontFamily: 'verdana_regular',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
