import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/note/note_detail/bloc/note_detail_bloc.dart';
import 'package:todo_list/views/view_model/note/note_view_model.dart';
import 'package:todo_list/views/view_model/note_task_content_view_model.dart';
import 'package:todo_list/views/widgets/note_task_content_common.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({Key? key, required this.noteViewModel}) : super(key: key);
  final NoteViewModel noteViewModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteDetailBloc()..add(NoteDetailInitialEvent(noteViewModel)),
      child: Scaffold(
        appBar: _appBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          context.router.pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorUtils.black,
        ),
      ),
      title: BlocBuilder<NoteDetailBloc, NoteDetailState>(
        builder: (context, state) {
          if (state is NoteDetailStableState) {
            return Text(
              state.noteDetailViewModel.title,
              style: TextStyleUtils.textStyleOpenSans20W400Black,
            );
          }
          return Text(
            L.current.loading,
            style: TextStyleUtils.textStyleOpenSans20W400Black,
          );
        },
      ),
      backgroundColor: ColorUtils.bgColor,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              // TODO: add task to project
            },
            icon: const Icon(
              Icons.more_vert_rounded,
              color: ColorUtils.black,
            )),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: BlocBuilder<NoteDetailBloc, NoteDetailState>(
          builder: (context, state) {
            if (state is NoteDetailStableState) {
              return NoteTaskContentCommon(
                noteTaskContentViewModel: NoteTaskContentViewModel(
                  subtitle: state.noteDetailViewModel.subtitle ?? '',
                  description: state.noteDetailViewModel.description ?? '',
                  project: state.noteDetailViewModel.projectViewModel.name,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

}
