import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/widgets/elevated_button_common.dart';
import 'package:todo_list/views/widgets/text_field_common.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(context),
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
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child: Text(
                        L.current.loginScreenTitle,
                        style: TextStyleUtils.textStyleOpenSans24W800,
                        maxLines: 3,
                      ),
                    ),
                    _formLogin(context)
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
          text: L.current.noAccountQuote,
          style: TextStyleUtils.textStyleOpenSans16W300Black,
          children: [
            const TextSpan(text: ' ',),
            TextSpan(
                text: L.current.signUpLabel,
                style: TextStyleUtils.textStyleOpenSans16W300Primary,
              recognizer: TapGestureRecognizer()..onTap = () {
                context.router.push(const SignUpScreenRoute(),);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _formLogin(BuildContext context) {
    return Column(
      children: [
        TextFieldCommon(
          hintText: L.current.hintTextEmail,
          hintStyle: TextStyleUtils.textStyleOpenSans16W300Grey9B,
          prefixIcon: const Icon(
            Icons.email,
            color: ColorUtils.black,
          ),
          style: TextStyleUtils.textStyleOpenSans16W300Black,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldCommon(
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Text(
                L.current.rememberMeLabel,
                style: TextStyleUtils.textStyleOpenSans14W300,
              ),
              const Spacer(),
            ],
          ),
        ),
        ElevatedButtonCommon(
          width: double.infinity,
          onPressed: () {},
          child: Text(L.current.loginLabel, style: TextStyleUtils.textStyleOpenSans24W700White,),
        ),
      ],
    );
  }
}
