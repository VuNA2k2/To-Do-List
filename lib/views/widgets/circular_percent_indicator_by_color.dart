import 'package:flutter/material.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/views/widgets/circular_percent_indicator_common.dart';

class CircularPercentIndicatorByColor extends CircularPercentIndicatorCommon {
  CircularPercentIndicatorByColor({super.key,
    required super.radius,
    required double percent,
    TextStyle? textStyle,
  }) : super(
          center: Text(
            "${FormatUtils.percentFormat(percent * 100)}%",
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          percent: percent,
          processColors: const [
            ColorUtils.red,
            ColorUtils.yellow,
            ColorUtils.green,
          ],
          processValueColors: const [
            0.5,
            0.75,
            1,
          ],
        );
}
