import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/dialog_helper.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/fill_profile/bloc/fill_profile_bloc.dart';
import 'package:todo_list/views/fill_profile/view_model/profile_mode.dart';
import 'package:todo_list/views/fill_profile/view_model/user_info_view_model.dart';
import 'package:todo_list/views/sign_up/view_model/account_view_model.dart';
import 'package:todo_list/views/widgets/avatar_common.dart';
import 'package:todo_list/views/widgets/text_field_common.dart';
import 'package:todo_list/views/widgets/text_field_label.dart';

import '../../languages/language.dart';
import '../widgets/elevated_button_common.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({Key? key, required this.accountViewModel, required this.profileMode, this.userInfoViewModel})
      : super(key: key);
  final AccountViewModel accountViewModel;
  final ProfileMode profileMode;
  final UserInfoViewModel? userInfoViewModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FillProfileBloc()
        ..add(FillProfileInitialEvent(accountViewModel: accountViewModel, profileMode: profileMode, userInfoViewModel: userInfoViewModel)),
      child: Scaffold(
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                L.current.fillProfileLabel,
                textAlign: TextAlign.center,
                style: TextStyleUtils.textStyleOpenSans24W700,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              child: _formProfile(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formProfile(BuildContext context) {
    return BlocConsumer<FillProfileBloc, FillProfileState>(
      listener: (context, state) {
        if(state is FillProfileValidState) {
          context.read<FillProfileBloc>().add(FillProfileSubmitEvent());
        } else if(state is FillProfileInvalidState) {
          DialogHelper.showSimpleDialog(context, L.current.error, state.message ?? L.current.errorDefaultMessage);
        } else if(state is FillProfileErrorState) {
          DialogHelper.showSimpleDialog(context, L.current.error, state.message ?? L.current.errorDefaultMessage);
        } else if(state is FillProfileSuccessState) {
          if(profileMode == ProfileMode.create) {
            context.router.replace(
              const LoginScreenRoute(),
            );
          } else {
            context.router.pop();
          }
        }
      },
      builder: (context, state) {
        if (state is FillProfileStableState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarCommon(
                avatar: (state.userInfoViewModel.avatar ?? '').isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: state.userInfoViewModel.avatar!,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.person,
                        ),
                      )
                    : const Icon(
                        Icons.person,
                      ),
                icon: InkWell(
                  onTap: () {
                    DialogHelper.showOptionDialog(
                        context, L.current.askSourceImage, [
                      L.current.camera,
                      L.current.gallery,
                    ], (value) {
                      ImageSource source;
                      if (value == 0) {
                        source = ImageSource.camera;
                      } else {
                        source = ImageSource.gallery;
                      }
                      ImagePicker().pickImage(source: source).then((value) {
                        if (value != null) {
                          UploadImageUseCase uploadImageUseCase =
                              ConfigDI().injector.get<UploadImageUseCase>();
                          uploadImageUseCase
                              .call(File(value.path))
                              .then((value) {
                            context.read<FillProfileBloc>().add(
                                FillProfileChangeAvatarEvent(avatar: value));
                          });
                        }
                      });
                    });
                  },
                  child: const Icon(
                    Icons.camera_alt_rounded,
                  ),
                ),
              ),
              _formUserName(context),
              _formInfo(context),
              _button(context),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _formUserName(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(8),
      child: TextFieldCommon(
        controller: context.read<FillProfileBloc>().usernameController,
        minLines: 1,
        maxLines: 1,
        hintText: L.current.hintTextUserName,
        contentPadding: const EdgeInsets.all(4),
        textAlign: TextAlign.center,
        maxLength: 8,
      ),
    );
  }

  Widget _formInfo(BuildContext context) {
    return Column(
      children: [
        _formField(context, L.current.fullNameLabel, context.read<FillProfileBloc>().fullNameController),
        _formField(
            context, L.current.dateOfBirthLabel, context.read<FillProfileBloc>().dateOfBirthController, true, () {
              showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.utc(70, 1, 1,), lastDate: DateTime.now()).then((value) {
                if (value != null) {
                  context.read<FillProfileBloc>().add(FillProfileChangeDateOfBirth(dateOfBirth: value));
                }
              });
        }),
        _formField(context, L.current.emailLabel, context.read<FillProfileBloc>().emailController),
        _formField(context, L.current.phoneNumberLabel, context.read<FillProfileBloc>().phoneController),
      ],
    );
  }

  Widget _formField(
      BuildContext context, String label, TextEditingController controller, [bool isReadOnly = false, Function()? onTap]) {
    return TextFieldLabel(
      label: label,
      labelStyle: TextStyleUtils.textStyleOpenSans16W600Blue05,
      controller: controller,
      contentStyle: TextStyleUtils.textStyleOpenSans16W600,
      readOnly: isReadOnly,
      onTap: onTap,
    );
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: Center(
        child: SizedBox(
          width: 100,
          child: ElevatedButtonCommon(
            onPressed: () {
              context.read<FillProfileBloc>().add(FillProfileValidateEvent());
            },
            child: Text(
              L.current.saveLabel,
              style: TextStyleUtils.textStyleOpenSans16W600White,
            ),
          ),
        ),
      ),
    );
  }
}
