import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/icon_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/task/create_task/bloc/create_task_bloc.dart';
import 'package:todo_list/views/task/create_task/view_model/task_mode.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_view_model.dart';
import 'package:todo_list/views/widgets/field_common.dart';
import 'package:todo_list/views/widgets/form_create_common.dart';
import 'package:todo_list/views/widgets/text_field_common.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key, required this.taskMode, this.taskDetailViewModel}) : super(key: key);
  final TaskMode taskMode;
  final TaskDetailViewModel? taskDetailViewModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTaskBloc(taskMode: taskMode, taskDetailViewModel: taskDetailViewModel)..add(CreateTaskInitialEvent()),
      child: Scaffold(
        appBar: _appBar(context),
        body: _body(context),
        backgroundColor: ColorUtils.bgColor,
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
        L.current.createNewTaskTitle,
        style: TextStyleUtils.textStyleOpenSans20W400Black,
      ),
      backgroundColor: ColorUtils.bgColor,
      elevation: 0,
      actions: [
        BlocBuilder<CreateTaskBloc, CreateTaskState>(
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  context.read<CreateTaskBloc>().add(CreateTaskSaveEvent());
                },
                icon: const Icon(
                  Icons.save,
                  color: ColorUtils.black,
                ));
          },
        ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _formData(context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _priority(context),
                      _numberOfPomodoro(context),
                      _deadline(context),
                      _project(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formData(BuildContext context) {
    return BlocBuilder<CreateTaskBloc, CreateTaskState>(
      builder: (context, state) {
        return FormCreateCommon(
          titleController: context.read<CreateTaskBloc>().titleController,
          subtitleController: context.read<CreateTaskBloc>().subtitleController,
          descriptionController:
              context.read<CreateTaskBloc>().descriptionController,
        );
      },
    );
  }

  Widget _priority(BuildContext context) {
    return BlocBuilder<CreateTaskBloc, CreateTaskState>(
      builder: (context, state) {
        if (state is CreateTaskStableState) {
          return FieldCommon(
            L.current.priorityLabel,
            DropdownButtonHideUnderline(
              child: DropdownButton<Priority>(
                icon: const SizedBox(),
                value: state.createTaskViewModel.priority,
                items: Priority.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 10,
                                height: 10,
                                color: e == Priority.LOW
                                    ? ColorUtils.lowPriorityColor
                                    : e == Priority.MEDIUM
                                        ? ColorUtils.mediumPriorityColor
                                        : ColorUtils.highPriorityColor,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              e.name,
                              style: TextStyleUtils.textStyleOpenSans16W400,
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<CreateTaskBloc>()
                        .add(CreateTaskChangePriorityEvent(value));
                  }
                },
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _numberOfPomodoro(BuildContext context) {
    return BlocBuilder<CreateTaskBloc, CreateTaskState>(
      builder: (context, state) {
        if (state is CreateTaskStableState) {
          return FieldCommon(
            L.current.numberOfPomodoroLabel,
            RatingBar(
              initialRating: state.createTaskViewModel.numberOfPomodoro.toDouble(),
              direction: Axis.horizontal,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: SvgPicture.asset(IconUtils.icPomodoroSmall),
                empty: SvgPicture.asset(IconUtils.icPomodoroSmallOff),
                half: SvgPicture.asset(IconUtils.icPomodoroSmallOff),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemSize: 24,
              onRatingUpdate: (rating) {
                context
                    .read<CreateTaskBloc>()
                    .add(CreateTaskChangeNumberOfPomodoroEvent(rating.toInt()));
              },
              glow: false,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _deadline(BuildContext context) {
    return BlocBuilder<CreateTaskBloc, CreateTaskState>(
      builder: (context, state) {
        if (state is CreateTaskStableState) {
          return FieldCommon(
            L.current.deadlineLabel,
            TextFieldCommon(
              controller: context
                  .select((CreateTaskBloc bloc) => bloc)
                  .deadlineController,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              suffixIcon: const Icon(
                Icons.edit_calendar_rounded,
                color: ColorUtils.black,
              ),
              readOnly: true,
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                      state.createTaskViewModel.deadline),
                ).then(
                  (time) {
                    if (time != null) {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      ).then(
                        (date) {
                          if (date != null) {
                            context.read<CreateTaskBloc>().add(
                                  CreateTaskChangeDeadlineEvent(
                                    DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                    ),
                                  ),
                                );
                          }
                        },
                      );
                    }
                  },
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _project(BuildContext context) {
    return BlocBuilder<CreateTaskBloc, CreateTaskState>(
      builder: (context, state) {
        if (state is CreateTaskStableState) {
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
                value: state.projectSelected,
                items: state.listProject
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
                        .read<CreateTaskBloc>()
                        .add(CreateTaskChangeProjectEvent(value));
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
