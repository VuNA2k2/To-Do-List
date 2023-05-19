import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/dialog_helper.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/note/create_note/bloc/create_note_bloc.dart';
import 'package:todo_list/views/note/create_note/view_model/note_mode.dart';
import 'package:todo_list/views/note/note_detail/view_model/note_detail_view_model.dart';
import 'package:todo_list/views/widgets/field_common.dart';
import 'package:todo_list/views/widgets/form_create_common.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({Key? key, required this.noteMode, this.noteDetailViewModel}) : super(key: key);
  final NoteMode noteMode;
  final NoteDetailViewModel? noteDetailViewModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNoteBloc(noteMode: noteMode, noteDetailViewModel: noteDetailViewModel)..add(CreateNoteInitialEvent()),
      child: BlocConsumer<CreateNoteBloc, CreateNoteState>(
        listener: (context, state) {
          if (state is CreateNoteErrorState) {
            DialogHelper.showSimpleDialog(context, L.current.error, state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: _appBar(context),
            body: _body(context),
          );
        },
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
      title: Text(
        L.current.createNewNoteTitle,
        style: TextStyleUtils.textStyleOpenSans20W400Black,
      ),
      backgroundColor: ColorUtils.bgColor,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              context.read<CreateNoteBloc>().add(CreateNoteSaveEvent());
            },
            icon: const Icon(
              Icons.save,
              color: ColorUtils.black,
            )),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                FormCreateCommon(
                  titleController: context.read<CreateNoteBloc>().titleController,
                  subtitleController: context.read<CreateNoteBloc>().subtitleController,
                  descriptionController: context.read<CreateNoteBloc>().descriptionController,
                ),
                _project(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _project(BuildContext context) {
    return BlocBuilder<CreateNoteBloc, CreateNoteState>(
      builder: (context, state) {
        if (state is CreateNoteStableState) {
          return FieldCommon(
            L.current.projectLabel,
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorUtils.greyED),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              width: double.infinity,
              height: 44,
              child: DropdownButton<ProjectViewModel>(
                value: state.selectedProjectViewModel,
                items: state.projectViewModels
                    .map(
                      (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<CreateNoteBloc>()
                        .add(CreateNoteChangeProjectEvent(projectViewModel: value));
                  }
                },
                icon: const Icon(Icons.expand_more_rounded),
                borderRadius: BorderRadius.circular(5),
                underline: const SizedBox(),
                isExpanded: true,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
