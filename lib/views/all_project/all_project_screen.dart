import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/views/all_project/bloc/all_project_bloc.dart';
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
    return BlocBuilder<AllProjectBloc, AllProjectState>(
      builder: (context, state) {
        if(state is AllProjectStableState) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<AllProjectBloc>().add(AllProjectInitialEvent());
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: context.read<AllProjectBloc>().scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                return ProjectItem( projectViewModel: state.projectViewModels[index],);
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
