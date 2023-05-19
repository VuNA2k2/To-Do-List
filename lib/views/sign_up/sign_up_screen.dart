import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/dialog_helper.dart';
import 'package:todo_list/views/sign_up/bloc/sign_up_bloc.dart';

import '../../languages/language.dart';
import '../../utils/color_utils.dart';
import '../../utils/text_style_utils.dart';
import '../widgets/elevated_button_common.dart';
import '../widgets/text_field_common.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc()..add(SignUpEventInit()),
      child: Scaffold(
        backgroundColor: Colors.white,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60, top: 100,),
                          child: Text(
                            L.current.signUpScreenTitle,
                            style: TextStyleUtils.textStyleOpenSans24W800,
                            maxLines: 3,
                          ),
                        ),
                        _formSignUp(context)
                      ],
                    ),
                  ),
                ),
                _footer(context),
              ],
            ),
          )),
    );
  }

  Widget _footer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: RichText(
        text: TextSpan(
          text: L.current.exitsAccountQuote,
          style: TextStyleUtils.textStyleOpenSans16W300Black,
          children: [
            const TextSpan(
              text: ' ',
            ),
            TextSpan(
              text: L.current.loginLabel,
              style: TextStyleUtils.textStyleOpenSans16W300Primary,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.router.replace(const LoginScreenRoute());
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _formSignUp(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if(state is SignUpValidState) {
          context.router.replace(FillProfileScreenRoute(accountViewModel: state.accountViewModel));
        } else if(state is SignUpInvalidState) {
          DialogHelper.showSimpleDialog(context, L.current.error, state.message ?? L.current.errorDefaultMessage);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            TextFieldCommon(
              controller: context
                  .read<SignUpBloc>()
                  .usernameController,
              hintText: L.current.hintTextUserName,
              hintStyle: TextStyleUtils.textStyleOpenSans16W300Grey9B,
              prefixIcon: const Icon(
                Icons.person,
                color: ColorUtils.black,
              ),
              style: TextStyleUtils.textStyleOpenSans16W300Black,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCommon(
              controller: context
                  .read<SignUpBloc>()
                  .passwordController,
              hintText: L.current.hintTextPassword,
              hintStyle: TextStyleUtils.textStyleOpenSans16W300Grey9B,
              prefixIcon: const Icon(
                Icons.lock,
                color: ColorUtils.black,
              ),
              suffixIcon: const Icon(
                Icons.remove_red_eye,
                color: ColorUtils.black,
              ),
              style: TextStyleUtils.textStyleOpenSans16W300Black,
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCommon(
              controller: context
                  .read<SignUpBloc>()
                  .confirmPasswordController,
              hintText: L.current.hintTextPassword,
              hintStyle: TextStyleUtils.textStyleOpenSans16W300Grey9B,
              prefixIcon: const Icon(
                Icons.lock,
                color: ColorUtils.black,
              ),
              suffixIcon: const Icon(
                Icons.remove_red_eye,
                color: ColorUtils.black,
              ),
              style: TextStyleUtils.textStyleOpenSans16W300Black,
              obscureText: true,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButtonCommon(
              width: double.infinity,
              onPressed: () {
                context.read<SignUpBloc>().add(SignUpEventSubmit());
              },
              child: Text(L.current.signUpLabel,
                style: TextStyleUtils.textStyleOpenSans24W700White,),
            ),
          ],
        );
      },
    );
  }
}
