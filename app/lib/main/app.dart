import 'package:app/routes/app_route.dart';
import 'package:app/shared/commons/presentation/home_page.dart';
import 'package:app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Resq Flutter Assignment',
      theme: appTheme,
      routerConfig: appRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
