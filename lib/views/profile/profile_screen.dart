
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/widgets/avatar_common.dart';
import 'package:todo_list/views/widgets/text_field_common.dart';
import 'package:todo_list/views/widgets/text_field_label.dart';

import '../../languages/language.dart';
import '../widgets/elevated_button_common.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  String? avatar;

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
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              child: _formProfile(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formProfile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AvatarCommon(
          avatar: avatar != null ? CachedNetworkImage(imageUrl: avatar ?? '') : const SizedBox(),
          icon: InkWell(
            onTap: () async {
              ImagePicker().pickImage(source: ImageSource.camera).then((value) async {
                if (value != null) {
                  UploadImageUseCase uploadImageUseCase = ConfigDI().injector.get();
                  String url = await uploadImageUseCase.call(File(value.path));
                  log(url);
                  setState(() {
                    avatar = url;
                  });
                }
              });
            },
            child: const Icon(
              Icons.camera_alt_rounded,
            ),
          ),
        ),
        _formUserName(context),
        _formInfo(context),
      ],
    );
  }

  Widget _formUserName(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(8),
      child: TextFieldCommon(
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
        _formField(context, L.current.fullNameLabel, TextEditingController()),
        _formField(context, L.current.dateOfBirthLabel, TextEditingController()),
        _formField(context, L.current.emailLabel, TextEditingController()),
        _formField(context, L.current.phoneNumberLabel, TextEditingController())
      ],
    );
  }

  Widget _formField(BuildContext context, String label, TextEditingController controller) {
    return TextFieldLabel(
      label: label,
      labelStyle: TextStyleUtils.textStyleOpenSans16W600Blue05,
      controller: controller,
      contentStyle: TextStyleUtils.textStyleOpenSans16W600,
    );
  }
}
