import 'package:flutter/material.dart';
import 'package:ola_mundo/src/views/home_page_view.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData.dark(),
      home: HomePage(key: super.key),
    );
  }
}
