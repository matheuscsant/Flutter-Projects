import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ola_mundo/src/controllers/home_controller.dart';
import 'package:ola_mundo/src/models/todo_model.dart';
import 'package:ola_mundo/src/repositories/todo_repository.dart';

void main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository: repository);
  test("Deve preencher variavel todos", () async {
    when(() => repository.fetchTodos())
        .thenAnswer((invocation) async => [TodoModel()]);
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });
  test("Deve modificar o estado para error se a requisição falhar", () async {
    when(() => repository.fetchTodos()).thenThrow(Exception());
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
  });
}

class TodoRepositoryMock extends Mock implements TodoRepository {}
