import 'package:entodo/model/todo_item.dart';
import 'package:entodo/utils/network_manager.dart';
import 'package:entodo/widget/item_widget.dart';
import 'package:flutter/material.dart';

class ToDoDonePage extends StatefulWidget {
  const ToDoDonePage({super.key});

  @override
  State<ToDoDonePage> createState() => _ToDoDonePageState();
}

class _ToDoDonePageState extends State<ToDoDonePage> {
  List<ToDoItem> todos = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    NetworkManager().getToDoIsDone(true).then((value) {
      todos = value;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Engene Todo App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "To Do Done",
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todoItem = todos[index];

                  return ItemWidget(
                    toDoItem: todoItem,
                    handleRefresh: () {},
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
