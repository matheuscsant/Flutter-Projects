import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  const SegundaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Olá segunda tela!"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Go back!",
            ),
          ),
        ),
      ),
    );
  }
}
