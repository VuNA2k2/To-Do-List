import 'package:data/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/services/shared_data/storage_service.dart';
import 'package:todo_list/utils/color_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService().init();
  await Firebase.initializeApp();
  initDataLayer();
  ConfigDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: ColorUtils.primaryColor,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}