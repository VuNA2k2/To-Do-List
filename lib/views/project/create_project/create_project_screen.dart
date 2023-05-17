import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/project/create_project/bloc/create_project_bloc.dart';
import 'package:todo_list/views/project/create_project/project_mode.dart';
import 'package:todo_list/views/widgets/form_create_common.dart';
import 'package:todo_list/views/widgets/text_field_common.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen(
      {Key? key, required this.projectMode, this.projectViewModel})
      : super(key: key);
  final ProjectMode projectMode;
  final ProjectViewModel? projectViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateProjectBloc(
          projectMode: projectMode, projectViewModel: projectViewModel)
        ..add(CreateProjectInitialEvent()),
      child: BlocBuilder<CreateProjectBloc, CreateProjectState>(
        builder: (context, state) {
          return Scaffold(
            appBar: _appBar(context),
            body: _body(context),
            backgroundColor: ColorUtils.bgColor,
          );
        },
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          context.router
              .pop(context.read<CreateProjectBloc>().projectViewModel);
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorUtils.black,
        ),
      ),
      title: Text(
        L.current.createNewProjectTitle,
        style: TextStyleUtils.textStyleOpenSans20W400Black,
      ),
      backgroundColor: ColorUtils.bgColor,
      elevation: 0,
      actions: [
        BlocBuilder<CreateProjectBloc, CreateProjectState>(
          builder: (context, state) {
            if (state is CreateProjectStableState) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<CreateProjectBloc>()
                        .add(CreateProjectSaveEvent());
                  },
                  icon: const Icon(
                    Icons.save,
                    color: ColorUtils.black,
                  ));
            }
            return const SizedBox();
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
                BlocBuilder<CreateProjectBloc, CreateProjectState>(
                  builder: (context, state) {
                    if (state is CreateProjectStableState) {
                      return FormCreateCommon(
                        titleController: context.select(
                            (CreateProjectBloc bloc) =>
                                bloc.projectNameController),
                        descriptionController: context.select(
                            (CreateProjectBloc bloc) =>
                                bloc.projectDescriptionController),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocBuilder<CreateProjectBloc, CreateProjectState>(
                        builder: (context, state) {
                          if (state is CreateProjectStableState) {
                            return _fieldTaskCommon(
                              L.current.priorityLabel,
                              DropdownButtonHideUnderline(
                                child: DropdownButton<Priority>(
                                  icon: const SizedBox(),
                                  value: state.createProjectViewModel.priority,
                                  items: Priority.values
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                  width: 10,
                                                  height: 10,
                                                  color: e == Priority.LOW
                                                      ? ColorUtils
                                                          .lowPriorityColor
                                                      : e == Priority.MEDIUM
                                                          ? ColorUtils
                                                              .mediumPriorityColor
                                                          : ColorUtils
                                                              .highPriorityColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                e.name,
                                                style: TextStyleUtils
                                                    .textStyleOpenSans16W400,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      context.read<CreateProjectBloc>().add(
                                          CreateProjectPriorityChangedEvent(
                                              priority: value));
                                    }
                                  },
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      BlocBuilder<CreateProjectBloc, CreateProjectState>(
                        builder: (context, state) {
                          if (state is CreateProjectStableState) {
                            return _fieldTaskCommon(
                              L.current.deadlineLabel,
                              TextFieldCommon(
                                controller: context
                                    .read<CreateProjectBloc>()
                                    .deadlineController,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                suffixIcon: const Icon(
                                  Icons.edit_calendar_rounded,
                                  color: ColorUtils.black,
                                ),
                                readOnly: true,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        state.createProjectViewModel.deadline),
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
                                              context
                                                  .read<CreateProjectBloc>()
                                                  .add(
                                                    CreateProjectDeadlineChangedEvent(
                                                      deadline: DateTime(
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
                      ),
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

  Widget _fieldTaskCommon(String label, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyleUtils.textStyleOpenSans16W600Blue05,
        ),
        const SizedBox(
          height: 5,
        ),
        content,
      ],
    );
  }
}
