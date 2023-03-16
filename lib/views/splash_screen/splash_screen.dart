import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/views/splash_screen/bloc/splash_bloc.dart';
import '../../route/route.gr.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashInitEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            // TODO: implement listener
            if(state is SplashHomeState) {
            //  TODO: navigate Home
              context.router.removeUntil((route) {
                context.replaceRoute(const HomeScreenRoute());
                return false;
              });
            } else if(state is SplashLoginState) {
              context.replaceRoute(const LoginScreenRoute());
              // context.router.removeUntil((route) {
              //   context.pushRoute(const LoginScreenRoute());
              //   return false;
              // });
            }
          },
          child: const Center(
            child:
                Text(
                  "Splash Screen",
                ),
          ),
        ),
      ),
    );
  }
}
