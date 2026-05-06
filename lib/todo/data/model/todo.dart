class Todo {
  int? id;
  String? todo;
  bool? completed;
  int? userId;
  Todo({this.id, this.todo, this.completed, this.userId});
  factory Todo.createFromJson(Map<String, dynamic> data) {
    return Todo(
        id: data['id'],
        todo: data['todo'],
        completed: data['completed'],
        userId: data['userId']);
  }
}
