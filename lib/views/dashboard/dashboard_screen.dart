import 'package:flutter/material.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/widgets/circular_percent_indicator_common.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircularPercentIndicatorCommon(
                radius: 60,
                center: Text(
                  "80%",
                  textAlign: TextAlign.center,
                  style: TextStyleUtils.textStyleOpenSans18W700,
                ),
                percent: 0.8,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
