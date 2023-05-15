import 'package:flutter/cupertino.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/view_model/note_task_content_view_model.dart';

class NoteTaskContentCommon extends StatelessWidget {
  final NoteTaskContentViewModel noteTaskContentViewModel;
  const NoteTaskContentCommon({Key? key, required this.noteTaskContentViewModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(noteTaskContentViewModel.subtitle.isNotEmpty) _contentItem(L.current.subtitleLabel, noteTaskContentViewModel.subtitle, TextStyleUtils.textStyleOpenSans16W600,),
        if(noteTaskContentViewModel.description.isNotEmpty) _contentItem(L.current.descriptionLabel, noteTaskContentViewModel.description,),
        if(noteTaskContentViewModel.project.isNotEmpty) _contentItem(L.current.projectLabel, noteTaskContentViewModel.project),
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
