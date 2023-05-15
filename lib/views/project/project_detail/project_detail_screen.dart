import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/project/project_detail/bloc/project_detail_bloc.dart';
import 'package:todo_list/views/widgets/circular_percent_indicator_by_color.dart';
import 'package:todo_list/views/widgets/search_bar_common.dart';
import 'package:todo_list/views/widgets/task_item.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({Key? key, required this.projectViewModel})
      : super(key: key);
  final ProjectViewModel projectViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ProjectDetailBloc()
        ..add(ProjectDetailInitialEvent(projectViewModel)),
      child: Scaffold(
        appBar: _appBar(context),
        body:  _body(context),
        backgroundColor: ColorUtils.bgColor,
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          _projectProgress(context),
          SearchBarCommon(),
          BlocBuilder<ProjectDetailBloc, ProjectDetailState>(
            builder: (context, state) {
              log('list rebuild');
              if (state is ProjectDetailStableState) {
                return Expanded(
                  child: ListView.separated(
                    controller: context.select((ProjectDetailBloc bloc) => bloc).scrollController,
                      itemBuilder: (context, index) {
                        return TaskItem(
                          taskViewModel: state.taskViewModels[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: state.taskViewModels.length),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          context.router.navigateBack();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorUtils.black,
        ),
      ),
      title: Text(
        "Project Name",
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
              Icons.save,
              color: ColorUtils.black,
            )),
      ],
    );
  }

  Widget _projectProgress(BuildContext context) {
    // ProjectDetailState state = context.select((ProjectDetailBloc bloc) =>
    // bloc.state);
    return BlocBuilder<ProjectDetailBloc, ProjectDetailState>(
      builder: (context, state) {
        log('progress rebuild');
        if (state is ProjectDetailStableState) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: ColorUtils.black.withOpacity(0.1),
                ),
              ],
              color: ColorUtils.bgColor,
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                CircularPercentIndicatorByColor(
                    radius: 60, percent: state.projectViewModel.progress / 100),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.projectViewModel.name,
                        style: TextStyleUtils.textStyleOpenSans20W800,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        state.projectViewModel.description ?? '',
                        style: TextStyleUtils.textStyleOpenSans16W600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${state.projectViewModel.progress}%",
                        style: TextStyleUtils.textStyleOpenSans12W300Grey81,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
