import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_flutter_1/todo/presentation/bloc_todo/todo_bloc.dart';
import 'package:lesson_flutter_1/todo/presentation/bloc_todo/todo_state.dart';
import 'package:lesson_flutter_1/todo/presentation/bloc_todo/todo_event.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoEventLoading());
    context.read<TodoBloc>().add(TodoEventGet());
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Page"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoStateLoading) {
            return const Text("Loading...");
          }
          if (state is TodoStateReady) {
            return Column(
              children:
                  state.todos!.map((element) => Text(element.todo!)).toList(),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
