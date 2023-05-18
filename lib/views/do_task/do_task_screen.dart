import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/icon_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/do_task/bloc/do_task_bloc.dart';
import 'package:todo_list/views/view_model/task/task_view_model.dart';
import 'package:todo_list/views/widgets/circular_percent_indicator_common.dart';

class DoTaskScreen extends StatelessWidget {
  const DoTaskScreen({Key? key, required this.taskViewModel}) : super(key: key);
  final TaskViewModel taskViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      DoTaskBloc()
        ..add(DoTaskInitialEvent(taskId: taskViewModel.id!)),
      child: Scaffold(
        body: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    return GestureDetector(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _header(context),
              _middle(context),
              _controlPanel(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return BlocBuilder<DoTaskBloc, DoTaskState>(
      builder: (context, state) {
        if (state is DoTaskStableState) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorUtils.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                    color: ColorUtils.black.withOpacity(0.25),
                  )
                ]),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: SvgPicture.asset(IconUtils.icForestLagre),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        state.taskDetailViewModel.title,
                        style: TextStyleUtils.textStyleOpenSans20W800,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          state.taskDetailViewModel.subtitle ?? "",
                          style: TextStyleUtils.textStyleOpenSans14W400,
                        ),
                      ),
                      Text(
                        state.taskDetailViewModel.description ?? "",
                        style: TextStyleUtils.textStyleOpenSans14W400,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${state.session}/${state.taskDetailViewModel.numberOfPomodoro}",
                        style: TextStyleUtils.textStyleOpenSans20W800,
                      ),
                      Text(
                        "${state.timeOfSession} minutes",
                        style: TextStyleUtils.textStyleOpenSans16W400BlackO62,
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

  Widget _middle(BuildContext context) {
    return BlocBuilder<DoTaskBloc, DoTaskState>(
      builder: (context, state) {
        if (state is DoTaskStableState) {
          return Column(
            children: [
              CircularPercentIndicatorCommon(
                radius: 100,
                percent: 1 - ((state.taskDetailViewModel.currentDoingTime!.inSeconds.remainder(1500)) /
                    const Duration(minutes: 25).inSeconds),
                processValueColors: const [
                  0.25,
                  0.5,
                  1,
                ],
                processColors: const [
                  ColorUtils.redEE,
                  ColorUtils.blue3F,
                  ColorUtils.cyan3F
                ],
              ),
              const SizedBox(height: 10,),
              Text("Stay focus of 25 minutes",
                style: TextStyleUtils.textStyleOpenSans20W400,),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _controlPanel(BuildContext context) {
    return BlocBuilder<DoTaskBloc, DoTaskState>(
      builder: (context, state) {
        if(state is DoTaskStableState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: const Icon(
                  Icons.replay,
                  color: ColorUtils.greyEA,
                  size: 32,
                ),
                onTap: () {
                  if(state is DoTaskPlayingState) {
                    context.read<DoTaskBloc>().add(DoTaskReplayEvent());
                  } else {
                    log("state is not DoTaskPlayingState: ${state.runtimeType}");
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  child: const Icon(
                    Icons.play_circle,
                    size: 72,
                    color: ColorUtils.greenOA,
                  ),
                  onTap: () {
                    if(state is! DoTaskPlayingState) {
                      context.read<DoTaskBloc>().add(DoTaskStartEvent(taskDetailViewModel: state.taskDetailViewModel));
                    } else {
                      log("state is DoTaskPlayingState: ${state.runtimeType}");
                    }
                  },
                ),
              ),
              InkWell(
                child: const Icon(
                  Icons.pause_circle_outline_rounded,
                  color: ColorUtils.greyEA,
                  size: 32,
                ),
                onTap: () {
                  if(state is DoTaskPlayingState) {
                    context.read<DoTaskBloc>().add(DoTaskPauseEvent());
                  } else {
                    log("state is not DoTaskPlayingState: ${state.runtimeType}");
                  }
                },
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
