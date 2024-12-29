import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:r4everstore/utils/constant.dart';

class AppDropdown extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final Function(dynamic value) onChanged;
  final String? hint;
  final String title;
  final bool loading;
  final dynamic value;
  const AppDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.hint,
    required this.title,
    this.loading = false,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)
        ),
        filled: true,
        fillColor: K.white,
        labelText: hint ?? title,
        labelStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
      icon: loading ? LoadingAnimationWidget.fourRotatingDots(color: K.primaryColor, size: 15) : null,
    );
  }
}
