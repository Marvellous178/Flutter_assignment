import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(task.title,
            style: TextStyle(
              decoration:
              task.isCompleted ? TextDecoration.lineThrough : null,
            )),
        subtitle: Text(task.description),
        trailing: Text(
          task.priority,
          style: TextStyle(
            color: task.priority == 'High'
                ? Colors.red
                : task.priority == 'Medium'
                ? Colors.orange
                : Colors.green,
          ),
        ),
      ),
    );
  }
}
