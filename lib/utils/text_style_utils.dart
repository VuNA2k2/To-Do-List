import 'package:flutter/cupertino.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/font_utils.dart';

class TextStyleUtils {
  static const TextStyle textStyleOpenSans = TextStyle(
    fontFamily: FontUtils.openSans
  );
  static TextStyle textStyleOpenSansW300 = textStyleOpenSans.copyWith(fontWeight: FontWeight.w300);

  static TextStyle textStyleOpenSansW400 = textStyleOpenSans.copyWith(fontWeight: FontWeight.w400);

  static TextStyle textStyleOpenSansW500 = textStyleOpenSans.copyWith(fontWeight: FontWeight.w500);

  static TextStyle textStyleOpenSansW600 = textStyleOpenSans.copyWith(fontWeight: FontWeight.w600);

  static TextStyle textStyleOpenSansW700 = textStyleOpenSans.copyWith(fontWeight: FontWeight.w700);

  static TextStyle textStyleOpenSansW800 = textStyleOpenSans.copyWith(fontWeight: FontWeight.w800);

  static TextStyle textStyleOpenSans14W300 = textStyleOpenSansW300.copyWith(fontSize: 14);

  static TextStyle textStyleOpenSans16W300 = textStyleOpenSansW300.copyWith(fontSize: 16);

  static TextStyle textStyleOpenSans16W600 = textStyleOpenSansW600.copyWith(fontSize: 16);

  static TextStyle textStyleOpenSans24W700 = textStyleOpenSansW700.copyWith(fontSize: 24);

  static TextStyle textStyleOpenSans24W800 = textStyleOpenSansW800.copyWith(fontSize: 24);

  static TextStyle textStyleOpenSans16W300Grey9B = textStyleOpenSans16W300.copyWith(color: ColorUtils.grey9B);

  static TextStyle textStyleOpenSans16W300Black = textStyleOpenSans16W300.copyWith(color: ColorUtils.black);

  static TextStyle textStyleOpenSans16W300Primary = textStyleOpenSans16W300.copyWith(color: ColorUtils.primaryColor);

  static TextStyle textStyleOpenSans16W600Blue05 = textStyleOpenSans16W600.copyWith(color: ColorUtils.blue05);

  static TextStyle textStyleOpenSans16W600White = textStyleOpenSans16W600.copyWith(color: ColorUtils.white);

  static TextStyle textStyleOpenSans24W700White = textStyleOpenSans24W700.copyWith(color: ColorUtils.white);
}