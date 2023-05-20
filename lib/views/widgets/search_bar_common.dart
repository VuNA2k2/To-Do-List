import 'package:flutter/material.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/widgets/text_field_common.dart';

class SearchBarCommon extends StatelessWidget {
  SearchBarCommon({Key? key, TextEditingController? controller, this.onTap})
      : super(key: key) {
    _controller = controller;
  }

  TextEditingController? _controller;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFieldCommon(
      controller: _controller,
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      fillColor: ColorUtils.greyE8,
      hintText: L.current.hintTextSearch,
      hintStyle: TextStyleUtils.textStyleOpenSans13W400Grey81,
      suffixIcon: InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.search,
          color: ColorUtils.black,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
