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
        Text(
          "Title",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            hintText: "Write your todo here...",
          ),
        ),
        SizedBox(height: 40),
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
