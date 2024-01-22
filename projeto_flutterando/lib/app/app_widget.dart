import 'package:flutter/material.dart';
import 'package:projeto_flutterando/app/controller/theme_controller.dart';
import 'package:projeto_flutterando/app/widget/converter_page_widget.dart';
import 'package:projeto_flutterando/app/widget/home_page_widget.dart';
import 'package:projeto_flutterando/app/widget/login_page_widget.dart';
import 'package:projeto_flutterando/app/widget/second_page_widget_2.dart';

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
        initialRoute: "/converter",
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
          "/converter": (context) => ConverterMoedas(
                key: super.key,
              ),
        },
      ),
    );
  }
}
