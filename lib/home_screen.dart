import 'package:flutter/material.dart';
import 'package:wri_mobile/modals/add_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> checkedList = List.generate(100, (index) => false);
  Map<String, dynamic> todosData = {};

  void addTodoModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: EdgeInsets.all(20),
            height: 300,
            child: AddTodo(),
          ),
        );
      },
    );
  }

  void addTodo() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[200],
        onPressed: addTodoModal,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue[200],
              ),
              height: 40,
              width: 40,
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintText: "Search..."),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "All ToDos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color:
                            checkedList[index] ? Colors.grey[50] : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          value: checkedList[index],
                          activeColor: Colors.blue,
                          side: BorderSide(color: Colors.blue, width: 2),
                          onChanged: (value) {
                            checkedList[index] = value!;
                            setState(() {});
                          },
                        ),
                        title: Text(
                          "Belajar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Belajar Desain Flutter",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.delete,
                          color: checkedList[index]
                              ? Colors.red[100]
                              : Colors.red[300],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
