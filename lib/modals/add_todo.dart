import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Title"),
        TextField(
          decoration: InputDecoration(
            hintText: "Write your todo here...",
          ),
        ),
        SizedBox(height: 50),
        Text("Description"),
        TextField(
          decoration: InputDecoration(
            hintText: "Write your todo here...",
          ),
        ),
      ],
    );
  }
}
