import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/core/app_styles.dart';
import 'package:todo_application/core/date_ex/date_ex.dart';
import 'package:todo_application/database_manager/model/todo_dm.dart';

class AddTasksBottomSheet extends StatefulWidget {
  final TodoDM? task;

  AddTasksBottomSheet({super.key, this.task});

  @override
  State<AddTasksBottomSheet> createState() => _AddTasksBottomSheetState();

  static Future show(BuildContext context, {TodoDM? task}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: AddTasksBottomSheet(task: task),
      ),
    );
  }
}

class _AddTasksBottomSheetState extends State<AddTasksBottomSheet> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing data if in edit mode
    titleController = TextEditingController(text: widget.task?.title ?? '');
    descriptionController =
        TextEditingController(text: widget.task?.description ?? '');
    if (widget.task != null) {
      selectedDate = widget.task!.dateTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * .4,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.task == null ? "Add Task" : "Edit Task",
              style: LightAppStyles.bottomSheetTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter task",
                hintStyle: LightAppStyles.hint,
              ),
              validator: (input) => input == null || input.trim().isEmpty
                  ? "Please enter task title"
                  : null,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "Enter task details",
                hintStyle: LightAppStyles.hint,
              ),
              validator: (input) {
                if (input == null || input.trim().isEmpty)
                  return "Please enter description";
                if (input.length < 6)
                  return "Description should be more than 6 characters";
                return null;
              },
            ),
            const SizedBox(height: 8),
            Text("Select date", style: LightAppStyles.date),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => showTaskDate(context),
              child: Text(selectedDate.toFormattedDate,
                  style: LightAppStyles.hint, textAlign: TextAlign.center),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => saveTaskToFireStore(),
              child: Text(widget.task == null ? "Add Task" : "Save Changes"),
            ),
          ],
        ),
      ),
    );
  }

  void showTaskDate(BuildContext context) async {
    selectedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        ) ??
        selectedDate;
    setState(() {});
  }

  void saveTaskToFireStore() {
    if (!formKey.currentState!.validate()) return;

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);
    DocumentReference documentReference = widget.task == null
        ? collectionReference.doc() // New task
        : collectionReference.doc(widget.task!.id); // Existing task

    TodoDM todo = TodoDM(
      id: documentReference.id,
      title: titleController.text,
      dateTime: selectedDate,
      description: descriptionController.text,
      isDone: widget.task?.isDone ?? false,
    );

    documentReference.set(todo.toFireStore()).then((_) {
      if (context.mounted) {
        Navigator.pop(context);
      }
    }).catchError((error) {
      print("Failed to save task: $error");
    });
  }
}
