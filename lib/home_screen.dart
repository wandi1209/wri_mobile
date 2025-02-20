import 'package:flutter/material.dart';
import 'package:wri_mobile/modals/add_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> todosData = [];

  void addTodo({required String title, required String desc}) {
    todosData.insert(0, {
      "title": title,
      "desc": desc,
      "isCompleted": false,
    });
    setState(() {});
    Navigator.pop(context);
  }

  void addTodoModal() {
    showModalBottomSheet(
      backgroundColor: Colors.grey[100],
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: EdgeInsets.all(20),
            height: 300,
            child: AddTodo(
              addTodo: addTodo,
            ),
          ),
        );
      },
    );
  }

  void deleteTodo({required int index}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure?"),
          content: Text("Are you sure delete this todo?"),
          backgroundColor: Colors.grey[100],
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                todosData.removeAt(index);
                setState(() {});
                Navigator.pop(context);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

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
              child: (todosData.isEmpty)
                  ? Center(
                      child: Text("No item on your to do list."),
                    )
                  : ListView.builder(
                      itemCount: todosData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: todosData[index]["isCompleted"]
                                  ? Colors.grey[50]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ListTile(
                              leading: Checkbox(
                                value: todosData[index]["isCompleted"],
                                activeColor: Colors.blue,
                                side: BorderSide(color: Colors.blue, width: 2),
                                onChanged: (value) {
                                  todosData[index]["isCompleted"] = value!;
                                  setState(() {});
                                },
                              ),
                              title: Text(
                                todosData[index]["title"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                todosData[index]["desc"],
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  deleteTodo(index: index);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: todosData[index]["isCompleted"]
                                      ? Colors.red[100]
                                      : Colors.red[300],
                                ),
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
