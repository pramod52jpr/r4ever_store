import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:r4everstore/utils/constant.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hint;
  final String title;
  final bool showTitle;
  final TextInputType? keyboardType;
  final bool isPassword;
  final Color filledColor;
  final Color titleColor;
  final ValueChanged onChanged;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;

  AppTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.hint,
    required this.title,
    this.showTitle = true,
    this.keyboardType,
    this.isPassword = false,
    this.filledColor = Colors.black,
    this.titleColor = Colors.black,
    required this.onChanged,
    this.inputFormatters,
    this.maxLines = 1,
  });

  final ValueNotifier<bool> obscureText = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if(showTitle)
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: 17
          ),
        ),
        ValueListenableBuilder(
          valueListenable: obscureText,
          builder: (context, obscure, child) {
            return TextFormField(
            controller: controller,
            initialValue: initialValue,
            maxLines: maxLines,
            keyboardType: keyboardType,
            obscureText: isPassword ? obscure : false,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
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
              alignLabelWithHint: true,
              suffixIcon: isPassword ? GestureDetector(
                onTap: () {
                  obscureText.value = !obscure;
                },
                  child: Icon( obscure ?  PhosphorIcons.eye_slash : PhosphorIcons.eye),
              ) : null,
            ),
          );
          },
        ),
      ],
    );
  }
}
