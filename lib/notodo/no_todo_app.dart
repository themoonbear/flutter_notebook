import 'package:flutter/material.dart';
import './no_todo_screen.dart';

class NoTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NoTodo"),
        backgroundColor: Colors.black54
      ),
      body: NoTodoScreen(),
    );
  }
}