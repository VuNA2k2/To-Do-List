import 'package:flutter/material.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/text_style_utils.dart';

class FormCreateCommon extends StatelessWidget {
  FormCreateCommon({
    Key? key,
    this.titleController,
    this.subtitleController,
    this.descriptionController,
  }) : super(key: key);
  final TextEditingController? titleController;
  final TextEditingController? subtitleController;
  final TextEditingController? descriptionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if(titleController != null) Flexible(
          child: TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: L.current.hintTextTitle,
              hintStyle: TextStyleUtils.textStyleOpenSans20W700Grey9F,
              border: InputBorder.none,
            ),
            style: TextStyleUtils.textStyleOpenSans20W700,
            maxLines: 1,
          ),
        ),
        if(subtitleController != null) Flexible(
          child: TextField(
            controller: subtitleController,
            decoration: InputDecoration(
              hintText: L.current.hintTextSubtitle,
              hintStyle: TextStyleUtils.textStyleOpenSans16W600GreyA3,
              border: InputBorder.none,
            ),
            maxLines: 1,
            style: TextStyleUtils.textStyleOpenSans16W600,
          ),
        ),
        if(descriptionController != null) Flexible(
          child: TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: L.current.hintTextDescription,
              hintStyle: TextStyleUtils.textStyleOpenSans16W600GreyA3,
              border: InputBorder.none,
            ),
            textInputAction: TextInputAction.newline,
            style: TextStyleUtils.textStyleOpenSans16W600,
            maxLines: 10,
          ),
        ),
      ],
    );
  }
}
