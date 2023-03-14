import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../languages/language.dart';
import '../../utils/color_utils.dart';
import '../../utils/text_style_utils.dart';
import '../widgets/elevate_button_common.dart';
import '../widgets/text_field_common.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
          style: TextStyleUtils.textStyleOpenSansBlack16W300,
          children: [
            const TextSpan(
              text: ' ',
            ),
            TextSpan(
              text: L.current.loginLabel,
              style: TextStyleUtils.textStyleOpenSansPrimary16W300,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.router.pop();
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _formSignUp(BuildContext context) {
    return Column(
      children: [
        TextFieldCommon(
          hintText: L.current.hintTextEmail,
          hintStyle: TextStyleUtils.textStyleOpenSansGrey9B16W300,
          prefixIcon: const Icon(
            Icons.email,
            color: ColorUtils.black,
          ),
          style: TextStyleUtils.textStyleOpenSansBlack16W300,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldCommon(
          hintText: L.current.hintTextPassword,
          hintStyle: TextStyleUtils.textStyleOpenSansGrey9B16W300,
          prefixIcon: const Icon(
            Icons.lock,
            color: ColorUtils.black,
          ),
          suffixIcon: const Icon(
            Icons.remove_red_eye,
            color: ColorUtils.black,
          ),
          style: TextStyleUtils.textStyleOpenSansBlack16W300,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldCommon(
          hintText: L.current.hintTextPassword,
          hintStyle: TextStyleUtils.textStyleOpenSansGrey9B16W300,
          prefixIcon: const Icon(
            Icons.lock,
            color: ColorUtils.black,
          ),
          suffixIcon: const Icon(
            Icons.remove_red_eye,
            color: ColorUtils.black,
          ),
          style: TextStyleUtils.textStyleOpenSansBlack16W300,
        ),
        const SizedBox(
          height: 40,
        ),
        ElevateButtonCommon(
          width: double.infinity,
          onPressed: () {},
          child: Text(L.current.signUpLabel),
        ),
      ],
    );
  }
}
