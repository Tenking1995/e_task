import 'package:e_task/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tasks.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  // final bool showCompleted;

  // TaskList(this.showCompleted);

  Future<void> _refreshTasks(BuildContext ctx) async {
    Provider.of<Tasks>(ctx, listen: false).fetchAndSetTasks();
  }

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<Tasks>(context);
    // final tasks = showCompleted ? taskData.completedTaskList : taskData.taskList;
    final tasks = taskData.taskList;

    return RefreshIndicator(
      onRefresh: () => _refreshTasks(context),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: tasks.length,
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider.value(
            value: tasks[i],
            child: TaskItem(
              tasks[i].id ?? '',
              tasks[i].title ?? '',
              tasks[i].progress ?? 0,
            ),
          );
        },
      ),
    );
  }
}
