import 'package:flutter/material.dart';
import 'package:projeto_flutterando/pages/home_page_widget.dart';
import 'package:projeto_flutterando/pages/login_page.dart';
import 'package:projeto_flutterando/pages/second_page_widget_2.dart';
import 'package:projeto_flutterando/theme_controller.dart';

class AppWidget extends StatelessWidget {
  final String title;
  final String titleCenter;

  const AppWidget({super.key, required this.title, required this.titleCenter});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, child) => MaterialApp(
        theme: ThemeData.from(
          colorScheme: ThemeController.instance.isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light(),
        ),
        // home: LoginPage(key: super.key),
        initialRoute: "/",
        routes: {
          "/": (context) => LoginPage(
                key: super.key,
              ),
          "/home": (context) => HomePage(
                key: super.key,
              ),
          "/home_caminho_2": (context) => SegundaTela(
                key: super.key,
              ),
        },
      ),
    );
  }
}
