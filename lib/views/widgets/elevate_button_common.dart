import 'package:flutter/material.dart';
import 'package:todo_list/utils/color_utils.dart';

class ElevateButtonCommon extends StatelessWidget {
  ElevateButtonCommon({super.key,
    required Function() onPressed,
    required Widget child,
    double? width,
  }) {
    _onPressed = onPressed;
    _child = child;
    _width = width;
  }

  late Function() _onPressed;
  late Widget _child;
  double? _width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: 44,child: ElevatedButton(
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorUtils.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: _child,
    ),);
  }
}
