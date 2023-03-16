import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_list/utils/color_utils.dart';

class CircularPercentIndicatorCommon extends StatelessWidget {
  CircularPercentIndicatorCommon(
      {Key? key,
      Widget? center,
      List<Color>? processColors,
      List<double>? processValueColors,
      required double percent,
      required double radius,})
      : super(key: key) {
    _radius = radius;
    _center = center;
    _percent = percent;
    _progressColors = processColors;
    _progressValueColors = processValueColors;
    if (_progressValueColors != null && _progressColors != null) {
      if (_progressValueColors?.length != _progressColors?.length) {
        throw Exception(
            "_processValueColors?.length != _processColors?.length");
      } else {
        _mapValueColor = _progressColors?.asMap().map((key, value) =>
            MapEntry(_progressValueColors!.asMap()[key]!, value));
        for (var it in _mapValueColor!.keys) {
          if (percent < it) {
            _progressColor = _mapValueColor![it];
            break;
          }
        }
      }
    } else if (!(_progressColors == null || _progressValueColors == null)) {
      throw Exception("_processColors or _processValueColors invalid");
    }
  }
  Map<double, Color>? _mapValueColor;
  late double _percent;
  Widget? _center;
  List<Color>? _progressColors;
  List<double>? _progressValueColors;
  Color? _progressColor;
  late double _radius;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: _radius,
      lineWidth: _radius / 6,
      // TODO: change progressColor by percent using if statement
      progressColor: _progressColor,
      percent: _percent,
      circularStrokeCap: CircularStrokeCap.round,
      center: Container(
        width: _radius,
        height: _radius,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius / 2),
            border: Border.all(color: ColorUtils.greyED)),
        alignment: Alignment.center,
        child: _center,
      ),
    );
  }
}
