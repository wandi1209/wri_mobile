import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTodo extends StatefulWidget {
  void Function({required String title, required String desc}) addTodo;
  AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleText = TextEditingController();
  TextEditingController descText = TextEditingController();

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
          controller: titleText,
          decoration: InputDecoration(
            hintText: "Write here...",
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Description",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextField(
          controller: descText,
          decoration: InputDecoration(
            hintText: "Write here...",
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blue[300]),
                onPressed: () {
                  if (titleText.text.isNotEmpty) {
                    if (descText.text.isEmpty) {
                      descText.text = "";
                    }
                    widget.addTodo(title: titleText.text, desc: descText.text);
                  }

                  titleText.text = "";
                  descText.text = "";
                },
                child: Text(
                  "Add Todo",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
