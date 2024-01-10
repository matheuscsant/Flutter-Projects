import 'package:flutter/material.dart';
import 'package:primeiro_programa/action_fab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Testando Expandable Menu',
            ),
          ],
        ),
      ),
      floatingActionButton: ExpandableFab(distance: 112, children: [
        ActionButton(
          onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text("Testando Dialong Format Text"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Fechar"),
                    )
                  ],
                );
              }),
          icon: const Icon(Icons.format_size),
        ),
        ActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text("Testando Dialog Photo"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Fechar"),
                  )
                ],
              );
            },
          ),
          icon: const Icon(Icons.insert_photo),
        ),
        ActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text("Testando Dialog Incremet"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Fechar"),
                  )
                ],
              );
            },
          ),
          icon: const Icon(Icons.add),
        ),
      ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
