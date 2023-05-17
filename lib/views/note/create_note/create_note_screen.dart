import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/note/create_note/bloc/create_note_bloc.dart';
import 'package:todo_list/views/widgets/form_create_common.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNoteBloc(),
      child: BlocBuilder<CreateNoteBloc, CreateNoteState>(
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
    return GestureDetector(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                FormCreateCommon(

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
