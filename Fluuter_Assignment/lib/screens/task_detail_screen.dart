import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;
  final Function(Task) onDelete;

  const TaskDetailScreen({
    super.key,
    required this.task,
    required this.onDelete,
  });

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Task?'),
                  content: const Text('Are you sure you want to delete this task?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel')),
                    TextButton(
                      onPressed: () {
                        widget.onDelete(widget.task);
                        Navigator.pop(context); // close dialog
                        Navigator.pop(context); // go back
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Priority: ${widget.task.priority}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(widget.task.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text('Mark as completed'),
              value: widget.task.isCompleted,
              onChanged: (value) {
                setState(() => widget.task.isCompleted = value!);
              },
            )
          ],
        ),
      ),
    );
  }
}
