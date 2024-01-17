import 'dart:developer';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          _configBody(context)
        ]),
      ),
    );
  }

  SizedBox _configBody(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              // child: Image.network(
              //   "https://quoininc.com/media_files/media_files/flutter%20logo%20%20resized.webp",
              // ),
              child: Image.asset("assets/images/dart_logo.png"),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 12, bottom: 12),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) => email = value,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: true,
                      decoration: const InputDecoration(
                        labelText: "User",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) => password = value,
                      enableSuggestions: false,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent),
                      ),
                      onPressed: () {
                        log("Validando login! Usuário: $email e Senha: $password");
                        if (email == "teste" && password == "123") {
                          log("Login válido");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => HomePage(
                          //       key: widget.key,
                          //     ),
                          //   ), Somente push, deixa voltar para a tela anterior
                          // );
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => HomePage(
                          //       key: widget.key,
                          //     ),
                          //   ),
                          // ); pushReplacement remove a tela anterior
                          // Navigator.of(context).pushNamed("/home");
                          Navigator.of(context).pushReplacementNamed("/home");
                        } else {
                          log("Login inválido");
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text(
                                      "Falha de login",
                                    ),
                                    content: const Text(
                                        "Usuário de desenvolvimento\nUsuário: teste\nSenha: 123"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text("Fechar"))
                                    ],
                                  ));
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
