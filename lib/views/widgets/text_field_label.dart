import 'package:flutter/material.dart';
import 'package:todo_list/views/widgets/text_field_common.dart';

class TextFieldLabel extends StatelessWidget {
  TextFieldLabel({Key? key, required String label, Widget? content, TextStyle? labelStyle, TextStyle? contentStyle, TextEditingController? controller}) : super(key: key) {
    _label = label;
    _labelStyle = labelStyle;
    _contentStyle = contentStyle;
    _controller = controller;
    _content = content ?? TextFieldCommon(controller: _controller, style: _contentStyle, contentPadding: const EdgeInsets.all(8),);
  }
  late String _label;
  late TextEditingController? _controller;
  late TextStyle? _labelStyle;
  late Widget _content;
  late TextStyle? _contentStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_label, style: _labelStyle,),
        _content,
      ],
    );
  }
}
