import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/dialog_helper.dart';
import 'package:todo_list/views/all_project/bloc/all_project_bloc.dart';
import 'package:todo_list/views/project/create_project/view_model/project_mode.dart';
import 'package:todo_list/views/widgets/project_item.dart';

class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllProjectBloc()..add(AllProjectInitialEvent()),
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocConsumer<AllProjectBloc, AllProjectState>(
      listener: (context, state) {
        if (state is AllProjectErrorState) {
          DialogHelper.showSimpleDialog(context, L.current.errorDefaultMessage, state.message);
        }
      },
      builder: (context, state) {
        if (state is AllProjectStableState) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<AllProjectBloc>().add(AllProjectInitialEvent());
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: context.read<AllProjectBloc>().scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                return ProjectItem(
                  projectViewModel: state.projectViewModels[index],
                  onDelete: (projectViewModel) {
                    context.read<AllProjectBloc>().add(
                        AllProjectDeleteProjectEvent(
                            projectId: projectViewModel.id));
                  },
                  onEdit: (projectViewModel) {
                    context.router.navigate(CreateProjectScreenRoute(projectMode: ProjectMode.edit, projectViewModel: projectViewModel)).then((value) {
                      context.read<AllProjectBloc>().add(AllProjectInitialEvent());
                    });
                  },
                );
              },
              itemCount: state.projectViewModels.length,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
