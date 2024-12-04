import 'package:flutter/material.dart';
import 'task_details.dart'; // Assurez-vous de l'importer
import 'task_form.dart'; // Importer la page de formulaire

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

class TaskList extends StatelessWidget {
  final List<Map<String, String>> tasks = [
    {'title': 'orange', 'description': 'Description de l\'orange'},
    {'title': 'mangue', 'description': 'Description de la mangue'},
    {'title': 'banana', 'description': 'Description du banana'},
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Tâches'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]['title']!),
            subtitle: Text(tasks[index]['description']!),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetails(
                      title: tasks[index]['title']!,
                      description: tasks[index]['description']!,
                      startDate: DateTime.parse(tasks[index]['startDate']!),
                      endDate: DateTime.parse(tasks[index]['endDate']!),
                    ),
                  ),
                );
              },
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskForm()), 
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Ajouter une tâche', 
      ),
    );
  }
}

