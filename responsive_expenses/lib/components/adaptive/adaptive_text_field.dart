import 'package:flutter/material.dart';

class AdaptiveTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onSubmitted;

  const AdaptiveTextField({
    super.key,
    this.label,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
