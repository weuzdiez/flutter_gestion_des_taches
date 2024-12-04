import 'package:flutter/material.dart';
import 'package:gestionnairetache/task_list.dart';

void main() {
  runApp(TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      home: TaskList(),
    );
  }
}

