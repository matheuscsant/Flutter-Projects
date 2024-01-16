import 'package:flutter/material.dart';
import 'package:projeto_flutterando/homePages/home_page_widget.dart';
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
        home: HomePage(key: super.key),
      ),
    );
  }
}
