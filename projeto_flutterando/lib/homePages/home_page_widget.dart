import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_flutterando/homePages/home_page_widget_2.dart';
import 'package:projeto_flutterando/theme_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Olá AppBar!"),
        actions: [
          SwitchTheme(key: widget.key),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Contador: $counter"),
          const Text("Escuridão?"),
          SwitchTheme(key: widget.key),
        ],
      )),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          log("Olá floating action button");
          setState(
            () {
              counter++;
            },
          );
        },
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Testando Drawer"),
          ),
          ListTile(
            title: const Text("Item 01"),
            onTap: () {
              log("Olá drawer!");
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SegundaTela(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Item 02"),
            onTap: () {
              log("Olá drawer 2!");
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class SwitchTheme extends StatelessWidget {
  const SwitchTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: ThemeController.instance.isDarkTheme,
      onChanged: (value) {
        ThemeController.instance.changeTheme();
      },
    );
  }
}
