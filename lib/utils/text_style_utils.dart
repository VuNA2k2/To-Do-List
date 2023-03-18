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

  static TextStyle textStyleOpenSans12W300 = textStyleOpenSansW300.copyWith(fontSize: 12);

  static TextStyle textStyleOpenSans14W300 = textStyleOpenSansW300.copyWith(fontSize: 14);

  static TextStyle textStyleOpenSans16W300 = textStyleOpenSansW300.copyWith(fontSize: 16);

  static TextStyle textStyleOpenSans12W400 = textStyleOpenSansW400.copyWith(fontSize: 12);

  static TextStyle textStyleOpenSans13W400 = textStyleOpenSansW400.copyWith(fontSize: 13);

  static TextStyle textStyleOpenSans20W400 = textStyleOpenSansW400.copyWith(fontSize: 20);

  static TextStyle textStyleOpenSans22W400 = textStyleOpenSansW400.copyWith(fontSize: 22);

  static TextStyle textStyleOpenSans14W500 = textStyleOpenSansW500.copyWith(fontSize: 14);

  static TextStyle textStyleOpenSans12W600 = textStyleOpenSansW600.copyWith(fontSize: 12);

  static TextStyle textStyleOpenSans16W600 = textStyleOpenSansW600.copyWith(fontSize: 16);

  static TextStyle textStyleOpenSans18W700 = textStyleOpenSansW700.copyWith(fontSize: 18);

  static TextStyle textStyleOpenSans24W700 = textStyleOpenSansW700.copyWith(fontSize: 24);

  static TextStyle textStyleOpenSans20W800 = textStyleOpenSansW800.copyWith(fontSize: 20);

  static TextStyle textStyleOpenSans24W800 = textStyleOpenSansW800.copyWith(fontSize: 24);

  static TextStyle textStyleOpenSans12W300Grey81 = textStyleOpenSans12W300.copyWith(color: ColorUtils.grey81);

  static TextStyle textStyleOpenSans16W300Grey9B = textStyleOpenSans16W300.copyWith(color: ColorUtils.grey9B);

  static TextStyle textStyleOpenSans16W300Black = textStyleOpenSans16W300.copyWith(color: ColorUtils.black);

  static TextStyle textStyleOpenSans16W300Primary = textStyleOpenSans16W300.copyWith(color: ColorUtils.primaryColor);

  static TextStyle textStyleOpenSans13W400Grey81 = textStyleOpenSans13W400.copyWith(color: ColorUtils.grey81);

  static TextStyle textStyleOpenSans16W600Blue05 = textStyleOpenSans16W600.copyWith(color: ColorUtils.blue05);

  static TextStyle textStyleOpenSans16W600White = textStyleOpenSans16W600.copyWith(color: ColorUtils.white);

  static TextStyle textStyleOpenSans24W700White = textStyleOpenSans24W700.copyWith(color: ColorUtils.white);

  static TextStyle textStyleOpenSans20W400Black = textStyleOpenSans20W400.copyWith(color: ColorUtils.black);

  static TextStyle textStyleOpenSans22W400Black = textStyleOpenSans22W400.copyWith(color: ColorUtils.black);
}