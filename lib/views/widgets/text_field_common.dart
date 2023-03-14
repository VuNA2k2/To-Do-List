import 'package:flutter/material.dart';

class TextFieldCommon extends TextField {
  TextFieldCommon({
    super.key,
    super.controller,
    super.style,
    super.minLines,
    super.maxLines,
    super.maxLength,
    super.obscureText,
    String? hintText,
    TextStyle? hintStyle,
    int? hintMaxLines,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? enabledBorder,
    InputBorder? disabledBorder,
  }) : super(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            enabledBorder: enabledBorder,
            disabledBorder: disabledBorder,
            hintText: hintText,
            hintStyle: hintStyle,
            hintMaxLines: hintMaxLines,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding,
          ),

        );
}
