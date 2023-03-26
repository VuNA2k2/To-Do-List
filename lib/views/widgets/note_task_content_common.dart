import 'package:flutter/cupertino.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/text_style_utils.dart';

class NoteTaskContentCommon extends StatelessWidget {
  const NoteTaskContentCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contentItem(L.current.subtitleLabel, "Task subtitle", TextStyleUtils.textStyleOpenSans16W600,),
        _contentItem(L.current.descriptionLabel, loremIpsum(words: 50),),
        _contentItem(L.current.projectLabel, "Thực tập cơ sở"),
      ],
    );
  }

  Widget _contentItem(String label, String content,
      [TextStyle? textStyleContent]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              label,
              style: TextStyleUtils.textStyleOpenSans16W600Blue05,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Flexible(
            child: Text(
              content,
              style: textStyleContent ?? TextStyleUtils.textStyleOpenSans16W400,
            ),
          ),
        ],
      ),
    );
  }
}
