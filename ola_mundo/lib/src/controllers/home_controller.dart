import 'package:flutter/foundation.dart';
import 'package:ola_mundo/src/models/todo_model.dart';
import 'package:ola_mundo/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository client;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController({repository}) : client = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await client.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
