// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:entodo/model/todo_item.dart';
import 'package:entodo/utils/network_manager.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.toDoItem,
    required this.handleRefresh,
  }) : super(key: key);
  final ToDoItem toDoItem;
  final Function() handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: toDoItem.isDone ? Colors.grey : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(toDoItem.title),
                  const SizedBox(height: 8),
                  Text(toDoItem.description),
                ],
              ),
            ),
            const SizedBox(width: 5),
            if (!toDoItem.isDone)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () async{
                  await NetworkManager().updateData(toDoItem.copyWith(isDone: true));
                  handleRefresh();
                },
                child: const Icon(Icons.check),
              ),
            const SizedBox(
              width: 8,
            ),
            if (!toDoItem.isDone)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () async{
                  await NetworkManager().deleteData(toDoItem);
                  handleRefresh();
                },
                child: const Icon(Icons.delete),
              ),
          ],
        ),
      ),
    );
  }
}
