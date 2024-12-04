import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;

  TaskDetails({
    required this.title,
    required this.description,
    this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // Affiche le titre de la tâche dans l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Affiche le titre
            Text('Titre : $title', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16), // Espace entre les éléments
            // Affiche la description
            Text('Description :', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(description),
            SizedBox(height: 16), // Espace entre les éléments
            // Affiche la date de début
            if (startDate != null)
              Text('Date de début : ${startDate!.toLocal().toString().split(' ')[0]}'), // Affichage formaté
            // Affiche la date de fin
            if (endDate != null)
              Text('Date de fin : ${endDate!.toLocal().toString().split(' ')[0]}'), // Affichage formaté
          ],
        ),
      ),
    );
  }
}

