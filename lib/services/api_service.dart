import 'package:dio/dio.dart';
import 'package:wri_mobile/controllers/add_todo.dart';
import 'package:wri_mobile/models/add_todos.dart';
import 'package:wri_mobile/models/get_todos_response.dart';

class ApiService {
  Dio _dio = Dio();

  ApiService() {}

  Future<GetTodosResponse> getTodos() async {
    try {
      Response response =
          await _dio.get("https://api.nstack.in/v1/todos?page=1&limit=10");
      return GetTodosResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AddTodos> addTodos(
      {required String title, required String desc}) async {
    try {
      Response response =
          await _dio.post("https://api.nstack.in/v1/todos", data: {
        "title": title,
        "description": desc,
        "is_completed": false,
      });
      return AddTodos.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AddTodos> deleteTodo({required String id}) async {
    try {
      Response response =
          await _dio.delete("https://api.nstack.in/v1/todos/${id}");
      return AddTodos.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
