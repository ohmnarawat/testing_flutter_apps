import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return Dismissible(
                  key: Key('$todo$index'),
                  onDismissed: (direction) => todos.removeAt(index),
                  background: Container(color: Colors.red),
                  child: ListTile(title: Text(todo)),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todos.add(controller.text);
            controller.clear();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
