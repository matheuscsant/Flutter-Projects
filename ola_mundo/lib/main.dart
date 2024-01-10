import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp("Testando"));
}

class MyApp extends StatefulWidget {
  const MyApp(this.name, {super.key});

  final String name;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double salario = 3500;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          log("Clicando");
          // aumentarSalario();
          diminuirSalario();
          log(salario.toString());
        },
        child: Text("Meu nome é ${widget.name} e meu salário é $salario",
            textDirection: TextDirection.ltr),
      ),
    );
  }

  void aumentarSalario() {
    setState(() {
      salario = salario + 100;
    });
  }

  void diminuirSalario() {
    setState(() {
      salario = salario - 100;
    });
  }
}
