import 'package:flutter/material.dart';
import 'package:wri_mobile/controllers/add_todo.dart';
import 'package:wri_mobile/models/get_todos_response.dart';
import 'package:wri_mobile/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> todosData = [];
  late GetTodosResponse _todos;
  bool isLoading = false;
  final apiService = ApiService();

  void getTodos() async {
    setState(() {
      isLoading = true;
    });

    final todos = await apiService.getTodos();
    setState(() {
      _todos = todos;
      isLoading = false;
    });
  }

  void addTodo({required String title, required String desc}) {
    todosData.insert(0, {
      "title": title,
      "desc": desc,
      "isCompleted": false,
    });
    setState(() {});
    Navigator.pop(context);
  }

  void addTodoList({required String title, required String desc}) async {
    await apiService.addTodos(
      title: title,
      desc: desc,
    );
    getTodos();
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
              addTodo: addTodoList,
            ),
          ),
        );
      },
    );
  }

  void deleteTodo({required String id}) {
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
              onPressed: () async {
                try {
                  await apiService.deleteTodo(id: id);
                } catch (e) {
                  print(e);
                }
                setState(() {});
                getTodos();
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
  void initState() {
    getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey[100],
        child: Column(
          children: [
            Container(
              color: Colors.blue[200],
              width: double.infinity,
              height: 150,
              child: Center(
                  child: Text(
                "ToDo App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.today),
              title: Text(
                "To Do",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.check_box),
              title: Text(
                "Completed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
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
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (_todos.items.isEmpty)
                      ? Center(
                          child: Text("No item on your to do list."),
                        )
                      : ListView.builder(
                          itemCount: _todos.items.length,
                          itemBuilder: (context, index) {
                            final todo = _todos.items[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: (todo.isCompleted)
                                      ? Colors.grey[50]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: ListTile(
                                  leading: Checkbox(
                                    value: _todos.items[index].isCompleted,
                                    activeColor: Colors.blue,
                                    side: BorderSide(
                                        color: Colors.blue, width: 2),
                                    onChanged: (value) {},
                                  ),
                                  title: Text(
                                    _todos.items[index].title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    _todos.items[index].description,
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      deleteTodo(id: _todos.items[index].id);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: _todos.items[index].isCompleted
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
