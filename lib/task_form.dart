import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>(); // Clé pour le formulaire
  String? _title;
  String? _description;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une Tâche'), // Titre de la page
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Ajout de la clé au formulaire
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Titre'), // Champ Titre
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un titre'; // Validation
                  }
                  return null; // Pas d'erreur
                },
                onSaved: (value) {
                  _title = value; // Sauvegarde du titre
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'), // Champ Description
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description'; // Validation
                  }
                  return null; // Pas d'erreur
                },
                onSaved: (value) {
                  _description = value; // Sauvegarde de la description
                },
              ),
              // Champ pour la date de début
              TextFormField(
                decoration: InputDecoration(labelText: 'Date de début'),
                readOnly: true, // Champ en lecture seule
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _startDate = pickedDate; // Sauvegarde de la date de début
                    });
                  }
                },
                validator: (value) {
                  if (_startDate == null) {
                    return 'Veuillez sélectionner une date de début';
                  }
                  return null; // Pas d'erreur
                },
              ),
              // Champ pour la date de fin
              TextFormField(
                decoration: InputDecoration(labelText: 'Date de fin'),
                readOnly: true, // Champ en lecture seule
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _endDate = pickedDate; // Sauvegarde de la date de fin
                    });
                  }
                },
                validator: (value) {
                  if (_endDate == null) {
                    return 'Veuillez sélectionner une date de fin';
                  }
                  return null; // Pas d'erreur
                },
              ),
              // Bouton pour enregistrer la tâche
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save(); // Sauvegarde des données du formulaire
                    // Formater les données en une Map
                    Map<String, dynamic> newTask = {
                      'title': _title,
                      'description': _description,
                      'startDate': _startDate,
                      'endDate': _endDate,
                    };
                    // Ici, tu peux traiter `newTask` comme tu le souhaites, comme l'ajouter à une liste
                    Navigator.pop(context); // Retour à la page précédente
                  }
                },
                child: Text('Enregistrer'), // Texte du bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}

