import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_notebook_background/responsive_notebook_background.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/view_model/note/note_view_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.noteViewModel}) : super(key: key);
  final NoteViewModel noteViewModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.navigate(NoteDetailScreenRoute(noteViewModel: noteViewModel));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
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
                noteViewModel.title,
                style: TextStyleUtils.textStyleOpenSans14W500,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
                noteViewModel.description ?? '',
                style: TextStyleUtils.textStyleOpenSans12W300,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
