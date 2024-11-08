import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/core/app_styles.dart';
import 'package:todo_application/core/colors_manager.dart';
import 'package:todo_application/core/date_ex/date_ex.dart';
import 'package:todo_application/database_manager/model/todo_dm.dart';
import 'package:todo_application/presentations/home_screen/tabs/tasks_tab/task_item/todo_item.dart';
import 'package:todo_application/settings_provider.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> {
  DateTime calenderSelectedDate = DateTime.now();
  List<TodoDM> todosList = [];

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    if (todosList.isEmpty) getTodoFromFireStore();
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: ColorsManager.blue,
              height: 90.h,
            ),
            buildCalender(),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TodoItem(
                todo: todosList[index],
                OnDeletedTask: () => getTodoFromFireStore(),
                onEditedTask: () => getTodoFromFireStore(),
              );
            },
            itemCount: todosList.length,
          ),
        ),
      ],
    );
  }

  Widget buildCalender() {
    return EasyInfiniteDateTimeLine(
      firstDate: DateTime.now().subtract(
        const Duration(days: 365),
      ),
      focusDate: calenderSelectedDate,
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      onDateChange: (selectedDate) {
        setState(() {
          calenderSelectedDate = selectedDate;
          getTodoFromFireStore();
        });
      },
      itemBuilder: (context, date, isSelected, onTap) {
        return InkWell(
          onTap: () {
            setState(() {
              calenderSelectedDate = date;
              getTodoFromFireStore();
            });
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.getDayName,
                  style: isSelected
                      ? LightAppStyles.calenderSelectedDate
                      : LightAppStyles.calenderUnSelectedDate,
                ),
                Text(
                  "${date.day}",
                  style: isSelected
                      ? LightAppStyles.calenderSelectedDate
                      : LightAppStyles.calenderUnSelectedDate,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Updated getTodoFromFireStore function
  void getTodoFromFireStore() async {
    CollectionReference todoCollection =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);

    QuerySnapshot collectionSnapshot = await todoCollection.get();
    List<QueryDocumentSnapshot> documentSnapShot = collectionSnapshot.docs;

    List<TodoDM> fetchedTodos = documentSnapShot.map((docSnapShot) {
      Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
      return TodoDM.fromFireStore(json);
    }).toList();

    List<TodoDM> filteredTodos = fetchedTodos
        .where((todo) =>
            todo.dateTime.day == calenderSelectedDate.day &&
            todo.dateTime.month == calenderSelectedDate.month &&
            todo.dateTime.year == calenderSelectedDate.year)
        .toList();

    setState(() {
      todosList = filteredTodos;
    });
  }
}
