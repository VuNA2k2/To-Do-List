import 'package:flutter/material.dart';
import 'package:todo_list/services/shared_data/storage_service.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'route/route.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService().init();
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