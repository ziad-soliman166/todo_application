import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/database_manager/model/todo_dm.dart';

class EditScreen extends StatefulWidget {
  final TodoDM task;

  EditScreen({super.key, required this.task});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController =
        TextEditingController(text: widget.task.description);
    selectedDate = widget.task.dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Enter task title",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter task title";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: "Enter task details",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter description";
                  } else if (value.length < 6) {
                    return "Description should be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text("Select date"),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => _showDatePicker(context),
                child: Text(
                  selectedDate.toString(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text("Save Changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _saveChanges() {
    if (!formKey.currentState!.validate()) return;

    FirebaseFirestore.instance
        .collection(TodoDM.collectionName)
        .doc(widget.task.id)
        .update({
          'title': titleController.text,
          'description': descriptionController.text,
          'dateTime': selectedDate,
        })
        .then((_) => Navigator.pop(context))
        .catchError((error) {
          print("Failed to update task: $error");
        });
  }
}
