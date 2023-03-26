import 'package:flutter/material.dart';
import 'package:todo_list/utils/color_utils.dart';

class TextFieldCommon extends TextField {
  TextFieldCommon({
    super.key,
    super.controller,
    super.style,
    super.minLines,
    super.maxLines,
    super.maxLength,
    super.obscureText,
    super.textAlign,
    String? hintText,
    TextStyle? hintStyle,
    int? hintMaxLines,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
    InputBorder? border,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? enabledBorder,
    InputBorder? disabledBorder,
    Color? fillColor,
    super.readOnly,
    super.onTap,
  }) : super(
          decoration: InputDecoration(
            border: border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: ColorUtils.greyCE)),
            focusedBorder: focusedBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: ColorUtils.greyCE)),
            errorBorder: errorBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: ColorUtils.greyCE)),
            enabledBorder: enabledBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: ColorUtils.greyCE)),
            disabledBorder: disabledBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: ColorUtils.greyCE)),
            hintText: hintText,
            hintStyle: hintStyle,
            hintMaxLines: hintMaxLines,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding,
            fillColor: fillColor,
            filled: fillColor != null,
            counter: const Offstage(),
          ),
        );
}
