import 'package:flutter/material.dart';
import 'package:ola_mundo/src/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.start();
  }

  _success() {
    return ListView.builder(
      itemCount: homeController.todos.length,
      itemBuilder: (context, index) {
        var todo = homeController.todos.elementAt(index);
        return ListTile(
          title: Text("Título: ${todo.title}"),
          subtitle: Text("Id: ${todo.id}"),
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) => setState(() => todo.completed = value),
          ),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () => homeController.start(),
        child: const Text("Tentar novamente"),
      ),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.error:
        return _error();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Todo's"),
        actions: [
          IconButton(
              onPressed: () => homeController.start(),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: AnimatedBuilder(
        animation: homeController.state,
        builder: (context, child) =>
            stateManagement(homeController.state.value),
      ),
    );
  }
}
