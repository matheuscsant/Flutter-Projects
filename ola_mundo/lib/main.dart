import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(
    title: "Testando certo!!!!",
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarTeste(),
    );
  }
}

class AppBarTeste extends StatelessWidget {
  const AppBarTeste({super.key, this.title = ""});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            tooltip: "Mostra Snackbar",
            icon: const Icon(Icons.add_alert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Testando snackbar"),
                ),
              );
            },
          )
        ],
      ),
      body: const Center(
        child: Text(
          "Olá mundo!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
