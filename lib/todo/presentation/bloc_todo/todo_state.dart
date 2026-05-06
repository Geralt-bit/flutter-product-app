import 'package:lesson_flutter_1/todo/data/model/todo.dart';

abstract class TodoState {}

class TodoStateInitial extends TodoState {}

class TodoStateLoading extends TodoState {}

class TodoStateReady implements TodoState {
  List<Todo>? todos;
  TodoStateReady({this.todos});
}
