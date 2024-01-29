import 'package:dio/dio.dart';
import 'package:ola_mundo/src/models/todo_model.dart';

class TodoRepository {
  Dio? dio;
  final String urlWebservice = "https://jsonplaceholder.typicode.com/todos";

  TodoRepository({Dio? client}) : dio = client ?? Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio!.get(urlWebservice);
    final list = response.data as List;
    return list.map((e) => TodoModel.fromJson(e)).toList();
  }
}
