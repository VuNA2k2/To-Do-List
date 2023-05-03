import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/all_notes/bloc/all_notes_bloc.dart';
import 'package:todo_list/views/widgets/note_item.dart';
import 'package:todo_list/views/widgets/search_bar_common.dart';

class AllNotesScreen extends StatelessWidget {
  const AllNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AllNotesBloc()
        ..add(AllNotesInitialEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            L.current.allNote,
            style: TextStyleUtils.textStyleOpenSans22W400Black,
          ),
          backgroundColor: ColorUtils.bgColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: ColorUtils.black,
            ),
            onPressed: () {
              context.router.pop();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: ColorUtils.black,),
            ),
          ],
        ),
        body: _body(context),
        backgroundColor: ColorUtils.bgColor,
      ),
    );
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SearchBarCommon(),
            ),
            BlocBuilder<AllNotesBloc, AllNotesState>(
              builder: (context, state) {
                if(state is AllNotesStableState) {
                  return Expanded(
                    child: MasonryGridView.count(
                      controller: context.read<AllNotesBloc>().scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemBuilder: (context, index) {
                        return NoteItem(noteViewModel: state.noteViewModels[index],);
                      },
                      itemCount: state.noteViewModels.length,
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
