import 'package:e_task/providers/tasks.dart';
import 'package:e_task/screens/edit_task_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/task_item.dart';

class ManageTasksScreen extends StatelessWidget {
  static const routeName = '/manage-tasks';

  Future<void> _refreshTasks(BuildContext ctx) async {
    Provider.of<Tasks>(ctx, listen: false).fetchAndSetTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Task'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshTasks(context),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () => _refreshTasks(context),
                child: Consumer<Tasks>(
                  builder: ((context, tasksData, _) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: tasksData.taskList.length,
                          itemBuilder: (cts, i) => Column(
                            children: [
                              TaskItem(tasksData.taskList[i].id ?? '', tasksData.taskList[i].title ?? '', tasksData.taskList[i].progress ?? 0, isEditFlow: true,),
                              const Divider(),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
      ),
    );
  }
}
