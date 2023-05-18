import 'package:auto_route/auto_route.dart';
import 'package:domain/src/entities/priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/utils/icon_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/task/create_task/view_model/task_mode.dart';
import 'package:todo_list/views/task/task_detail/bloc/task_detail_bloc.dart';
import 'package:todo_list/views/view_model/note_task_content_view_model.dart';
import 'package:todo_list/views/view_model/task/task_view_model.dart';
import 'package:todo_list/views/widgets/note_task_content_common.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({Key? key, required this.taskViewModel}) : super(key: key);
  final TaskViewModel taskViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      TaskDetailBloc()
        ..add(TaskDetailInitialEvent(taskViewModel: taskViewModel)),
      child: BlocBuilder<TaskDetailBloc, TaskDetailState>(
  builder: (context, state) {
    return Scaffold(
        appBar: _appBar(context),
        body: _body(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: state is TaskDetailStableState ? FloatingActionButton(
          onPressed: () {
            context.router.replace(DoTaskScreenRoute(taskViewModel: taskViewModel));
          },
          backgroundColor: ColorUtils.greenOA,
          child: const Icon(Icons.play_arrow_rounded),
        ) : null,
        backgroundColor: ColorUtils.bgColor,
      );
  },
),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TaskDetailBloc, TaskDetailState>(
        builder: (context, state) {
          if(state is TaskDetailStableState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NoteTaskContentCommon(
                      noteTaskContentViewModel: NoteTaskContentViewModel(
                        subtitle: state.taskDetailViewModel.subtitle ?? '',
                        description:
                            state.taskDetailViewModel.description ?? '',
                        project: state.taskDetailViewModel.project.name,
                      ),
                    ),
                    _numberOfPomodoro(context),
                    _progress(context),
                    _deadline(context),
                    _priority(context),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    TaskDetailState state = context.select((TaskDetailBloc bloc) => bloc.state);
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
        state is TaskDetailStableState ? state.taskDetailViewModel.title: 'Task Detail',
        style: TextStyleUtils.textStyleOpenSans20W400Black,
      ),
      backgroundColor: ColorUtils.bgColor,
      elevation: 0,
      actions: [
        BlocBuilder<TaskDetailBloc, TaskDetailState>(
          builder: (context, state) {
            if (state is TaskDetailStableState) {
              return PopupMenuButton(
                child: const Icon(
                  Icons.more_vert_rounded,
                  color: ColorUtils.black,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      value: 0,
                      onTap: () {
                        context.router.replace(CreateTaskScreenRoute(
                            taskMode: TaskMode.edit,
                            taskDetailViewModel: state.taskDetailViewModel));
                      },
                      child: Text(
                        L.current.edit,
                        style: TextStyleUtils.textStyleOpenSans16W600Blue05,
                      )),
                  PopupMenuItem(
                    onTap: () {
                      context.read<TaskDetailBloc>().add(TaskDetailDeleteEvent(taskDetailViewModel: state.taskDetailViewModel));
                      context.router.pop();
                    },
                    value: 1,
                    child: Text(
                      L.current.delete,
                      style: TextStyleUtils.textStyleOpenSans16W600Blue05,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _contentItem(String? label, Widget content, [Widget? widgetLabel]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: widgetLabel ??
                Text(
                  label ?? '',
                  style: TextStyleUtils.textStyleOpenSans16W600Blue05,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          const SizedBox(
            height: 6,
          ),
          Flexible(
            child: content,
          ),
        ],
      ),
    );
  }

  Widget _numberOfPomodoro(BuildContext context) {
    final TaskDetailState state = context.select((TaskDetailBloc bloc) => bloc.state);
    if(state is TaskDetailStableState) {
      return _contentItem(
        L.current.numberOfPomodoroLabel,
        Row(
          children: [
            for (int i = 0; i < state.taskDetailViewModel.numberOfPomodoro; i++)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  IconUtils.icPomodoroSmall,
                  width: 24,
                  height: 24,
                ),
              ),
          ],
        ),
      );
    }
    return const SizedBox();

  }

  Widget _progress(BuildContext context) {
    TaskDetailState state = context.select((TaskDetailBloc bloc) => bloc.state);
    if(state is TaskDetailStableState) {
      return _contentItem(
        null,
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          barRadius: const Radius.circular(10),
          percent: state.taskDetailViewModel.progress / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              L.current.progressLabel,
              style: TextStyleUtils.textStyleOpenSans16W600Blue05,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${state.taskDetailViewModel.progress.toStringAsFixed(0)}%',
              style: TextStyleUtils.textStyleOpenSans14W300Grey75,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  Widget _deadline(BuildContext context) {
    TaskDetailState state = context.select((TaskDetailBloc bloc) => bloc.state);
    if(state is TaskDetailStableState) {
      return _contentItem(
        L.current.deadlineLabel,
        Text(
          FormatUtils.dateTimeFormat.format(state.taskDetailViewModel.deadline),
          style: TextStyleUtils.textStyleOpenSans16W400,
        ),
      );
    }
    return const SizedBox();
  }

  Widget _priority(BuildContext context) {
    TaskDetailState state = context.select((TaskDetailBloc bloc) => bloc.state);
    if(state is TaskDetailStableState) {
      return _contentItem(
        L.current.priorityLabel,
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 10,
                height: 10,
                color: _colorByPriority(state.taskDetailViewModel.priority),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              state.taskDetailViewModel.priority.name,
              style: TextStyleUtils.textStyleOpenSans16W400,
            )
          ],
        ),
      );
    }
    return const SizedBox();
  }

  Color _colorByPriority(Priority priority) {
    switch (priority) {
      case Priority.LOW:
        return ColorUtils.greyED;
      case Priority.MEDIUM:
        return ColorUtils.yellow;
      case Priority.HIGH:
        return ColorUtils.red;
    }
  }
}
