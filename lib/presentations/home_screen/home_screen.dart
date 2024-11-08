import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_application/core/colors_manager.dart';
import 'package:todo_application/presentations/home_screen/add_tasks_bottom_sheet/add_tasks_bottom_sheet.dart';
import 'package:todo_application/presentations/home_screen/tabs/settings_tab/settings_tab.dart';
import 'package:todo_application/presentations/home_screen/tabs/tasks_tab/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  GlobalKey<TasksTabState> tasksTabKey = GlobalKey();

  List<Widget> tabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = [
      TasksTab(
        key: tasksTabKey,
      ),
      SettingsTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFab(),
      bottomNavigationBar: buildBottomNavBar(),
      body: tabs[currentIndex],
    );
  }

  Widget buildBottomNavBar() => ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomAppBar(
          notchMargin: 8,
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tasks"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined), label: 'Settings'),
              ]),
        ),
      );
  Widget buildFab() => FloatingActionButton(
        shape: const StadiumBorder(
          side: BorderSide(color: ColorsManager.white, width: 4),
        ),
        onPressed: () async {
          await AddTasksBottomSheet.show(context);
          tasksTabKey.currentState?.getTodoFromFireStore();
        },
        child: const Icon(Icons.add),
      );
}
