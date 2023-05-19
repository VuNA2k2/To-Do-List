import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/dialog_helper.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/profile/bloc/profile_bloc.dart';
import 'package:todo_list/views/widgets/avatar_common.dart';
import 'package:todo_list/views/widgets/elevated_button_common.dart';

import '../../languages/language.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(ProfileInitialEvent()),
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileErrorState) {
            DialogHelper.showSimpleDialog(
                context, L.current.error, state.message);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<ProfileBloc>().add(ProfileInitialEvent());
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 20),
                    child: _formProfile(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButtonCommon(
                        onPressed: () {
                          LogoutUseCase logoutUseCase =
                              ConfigDI().injector.get();
                          logoutUseCase.call().then((value) {
                            AutoRouter.of(context).pushAndPopUntil(
                                const LoginScreenRoute(),
                                predicate: (route) => false);
                          });
                        },
                        child: Text(L.current.logout)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _formProfile(BuildContext context) {
    ProfileState state = context.select((ProfileBloc bloc) => bloc.state);
    if (state is ProfileStableState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: AvatarCommon(
              avatar: state.userInfoViewModel.avatar != null
                  ? CachedNetworkImage(
                      imageUrl: state.userInfoViewModel.avatar!)
                  : const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _formInfo(context),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _formInfo(BuildContext context) {
    ProfileState state = context.select((ProfileBloc bloc) => bloc.state);
    if (state is ProfileStableState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _formField(
              context, L.current.fullNameLabel, state.userInfoViewModel.name),
          if (state.userInfoViewModel.dateOfBirth != null)
            _formField(
                context,
                L.current.dateOfBirthLabel,
                FormatUtils.dateFormat
                    .format(state.userInfoViewModel.dateOfBirth!)),
          _formField(
              context, L.current.emailLabel, state.userInfoViewModel.email),
          if (state.userInfoViewModel.phoneNumber != null)
            _formField(context, L.current.phoneNumberLabel,
                state.userInfoViewModel.phoneNumber!)
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _formField(BuildContext context, String label, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyleUtils.textStyleOpenSans16W600Blue05,
        ),
        Text(value)
      ],
    );
  }
}
