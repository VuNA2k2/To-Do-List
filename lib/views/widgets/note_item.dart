import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:responsive_notebook_background/responsive_notebook_background.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorUtils.primaryColor.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveNotebookBackground(
            options: ResponsiveNotebookBackgroundOptions(
              backgroundColor: Colors.transparent,
              horizontalPadding: 4,
              styleForHeightCalculation: TextStyleUtils.textStyleOpenSans14W500,
            ),
            child: Text(
              loremIpsum(words: 5),
              style: TextStyleUtils.textStyleOpenSans14W500,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 8,),
          ResponsiveNotebookBackground(
            options: ResponsiveNotebookBackgroundOptions(
              backgroundColor: Colors.transparent,
              horizontalPadding: 4,
              styleForHeightCalculation: TextStyleUtils.textStyleOpenSans12W300,
            ),
            child: Text(
              loremIpsum(words: 50),
              style: TextStyleUtils.textStyleOpenSans12W300,
            ),
          ),
        ],
      ),
    );
  }
}
