import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/core/app_styles.dart';
import 'package:todo_application/core/colors_manager.dart';
import 'package:todo_application/database_manager/model/todo_dm.dart';
import 'package:todo_application/settings_provider.dart';

import '../../../add_tasks_bottom_sheet/add_tasks_bottom_sheet.dart';

class TodoItem extends StatelessWidget {
  TodoItem(
      {super.key,
      required this.todo,
      required this.OnDeletedTask,
      required this.onEditedTask});
  TodoDM todo;
  Function OnDeletedTask;
  Function onEditedTask;
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: myProvider.currentTheme == ThemeMode.light
            ? ColorsManager.white
            : ColorsManager.darkBottomSheet,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: .3,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              onPressed: (context) {
                deleteTodoFromFireStore(todo);
                OnDeletedTask();
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: .3,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              onPressed: (context) async {
                await AddTasksBottomSheet.show(context, task: todo);
                onEditedTask(); // Refresh the list after editing
              },
              backgroundColor: ColorsManager.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: myProvider.currentTheme == ThemeMode.light
                ? ColorsManager.white
                : ColorsManager.darkBottomSheet,
          ),
          child: Row(
            children: [
              Container(
                height: 62.h,
                width: 4.w,
                decoration: BoxDecoration(
                  color: ColorsManager.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    todo.title,
                    style: LightAppStyles.todoTitle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    todo.description,
                    style: myProvider.currentTheme == ThemeMode.light
                        ? LightAppStyles.todoDescription
                        : LightAppStyles.todoDescriptionDark,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: ColorsManager.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: ColorsManager.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  deleteTodoFromFireStore(TodoDM todo) async {
    CollectionReference todoCollection =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);
    DocumentReference todoDoc = todoCollection.doc(todo.id);
    await todoDoc.delete();
  }
}
