import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_flutterando/controller/theme_controller.dart';

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
          // SwitchTheme(key: widget.key),
          GestureDetector(
            child: const Icon(
              Icons.logout_outlined,
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed("/"),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // scrollDirection: Axis.horizontal,
          children: [
            Text("Contador: $counter"),
            const Text("Escuridão?"),
            SwitchTheme(key: widget.key),
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.cyanAccent,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.lime,
                ),
              ],
            )
          ],
        ),
      ),
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
          const UserAccountsDrawerHeader(
            otherAccountsPictures: [
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://dwglogo.com/wp-content/uploads/2018/03/Dart_logo-1024x705.png"),
                  backgroundColor: Colors.white),
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.icon-icons.com/icons2/2415/PNG/512/java_original_wordmark_logo_icon_146459.png"),
                  backgroundColor: Colors.white),
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.icon-icons.com/icons2/2699/PNG/512/postgresql_vertical_logo_icon_168900.png"),
                  backgroundColor: Colors.white)
            ],
            accountName: Text("Usuário teste"),
            accountEmail: Text("teste@teste.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png"),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            title: const Text("Home"),
            subtitle: const Text("Ir para home 2"),
            leading: const Icon(Icons.work_outline_sharp),
            onTap: () {
              log("Olá drawer!");
              Navigator.pop(context);
              Navigator.of(context).pushNamed("/home_caminho_2");
            },
          ),
          ListTile(
            title: const Text("Logout"),
            subtitle: const Text("Realizar logout"),
            leading: const Icon(Icons.logout),
            onTap: () {
              log("Olá drawer 2!");
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          const Divider(),
          const ListTile(
            title: Text("Outro menu"),
            subtitle: Text("Testando o Divider()"),
            leading: Icon(Icons.upgrade_outlined),
          ),
          const Divider(),
          ListTile(
            title: const Text("Conversor de moedas"),
            subtitle: const Text("Primeiro projeto"),
            leading: const Icon(Icons.account_balance_outlined),
            onTap: () {
              log("Projeto 1 -> Conversor de moedas");
              Navigator.pop(context);
              Navigator.of(context).pushNamed("/converter");
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
