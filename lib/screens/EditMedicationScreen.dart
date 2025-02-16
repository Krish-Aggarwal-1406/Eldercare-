import 'package:flutter/material.dart';

class EditMedicationScreen extends StatefulWidget {
  final String name;
  final String dose;
  final String time;
  final Function(String, String, String) onSave;

  EditMedicationScreen({
    required this.name,
    required this.dose,
    required this.time,
    required this.onSave,
  });

  @override
  _EditMedicationScreenState createState() => _EditMedicationScreenState();
}

class _EditMedicationScreenState extends State<EditMedicationScreen> {
  late TextEditingController nameController;
  late TextEditingController doseController;
  late TextEditingController timeController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    doseController = TextEditingController(text: widget.dose);
    timeController = TextEditingController(text: widget.time);
  }

  @override
  void dispose() {
    nameController.dispose();
    doseController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Medication")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Medication Name"),
            ),
            TextField(
              controller: doseController,
              decoration: InputDecoration(labelText: "Dose"),
            ),
            TextField(
              controller: timeController,
              decoration: InputDecoration(labelText: "Time"),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                widget.onSave(
                  nameController.text,
                  doseController.text,
                  timeController.text,
                );
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}