import 'package:flutter/material.dart';
import 'package:todo_list/utils/color_utils.dart';

import '../../languages/language.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Column(
          children: [
            Text(L.current.fillProfileLabel),
            Expanded(
              child: _formProfile(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formProfile(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: ColorUtils.primaryColor, width: 10),
                shape: BoxShape.circle,
              ),
            ),
            Positioned(child: Icon(Icons.camera_alt_rounded, ))
          ],
        ),
      ],
    );
  }
}
