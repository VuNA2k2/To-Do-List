import 'package:flutter/material.dart';
import 'package:todo_list/utils/text_style_utils.dart';

class FieldCommon extends StatelessWidget {
  const FieldCommon(this.label, this.content, {Key? key,}) : super(key: key);
  final String label;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyleUtils.textStyleOpenSans16W600Blue05,
        ),
        const SizedBox(
          height: 5,
        ),
        content,
      ],
    );
  }
}
