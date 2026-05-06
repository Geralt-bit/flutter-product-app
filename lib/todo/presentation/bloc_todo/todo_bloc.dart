import 'package:bloc/bloc.dart';
import 'package:lesson_flutter_1/todo/presentation/bloc_todo/todo_event.dart';
import 'package:lesson_flutter_1/todo/presentation/bloc_todo/todo_state.dart';
import 'package:dio/dio.dart';
import 'package:lesson_flutter_1/todo/data/model/todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoStateInitial()) {
    on<TodoEventLoading>((event, emit) {
      emit(TodoStateLoading());
    });
    on<TodoEventGet>((event, emit) async {
      final dio = Dio();
      final response = await dio.get('https://dummyjson.com/todos');

      print(response.data);

      List<Todo> todos = [];
      for (var item in response.data["todos"]) {
        todos.add(Todo.createFromJson(item));
      }
      emit(TodoStateReady(todos: todos));
    });
  }
}
