import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/tasks.dart';

class TaskDetailsScreen extends StatefulWidget {
  static const routeName = '/task-details';

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var _progressTextFieldController = TextEditingController();
    final taskId = ModalRoute.of(context)?.settings.arguments as String?;
    var loadedTask = Provider.of<Tasks>(
      context,
      listen: false,
    ).findById(taskId ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedTask.title ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Title: ${loadedTask.title}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Description: ${loadedTask.description}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Start Date: ${DateFormat('yyyy-MM-dd – hh:mm a').format(loadedTask.startDate!)}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'End Date: ${DateFormat('yyyy-MM-dd – hh:mm a').format(loadedTask.endDate!)}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Create Date: ${DateFormat('yyyy-MM-dd – hh:mm a').format(loadedTask.createdDate!)}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Last update Date: ${DateFormat('yyyy-MM-dd – hh:mm a').format(loadedTask.lastUpdatedDate!)}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Creator: ${loadedTask.creatorId}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  onPressed: () {
                    if ((loadedTask.progress ?? 0) < 100) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Progress'),
                              content: TextField(
                                onChanged: (value) {},
                                keyboardType: TextInputType.number,
                                controller: _progressTextFieldController,
                                decoration: InputDecoration(hintText: "Enter Value"),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('Okay'),
                                  onPressed: () async {
                                    if (int.tryParse(_progressTextFieldController.text) != null &&
                                        int.tryParse(_progressTextFieldController.text)! < 100 &&
                                        int.tryParse(_progressTextFieldController.text)! >= 0) {
                                      loadedTask.progress = int.parse(_progressTextFieldController.text);
                                      await Provider.of<Tasks>(context, listen: false)
                                          .updateTask(loadedTask.id ?? '', loadedTask);
                                      debugPrint('showDialog');
                                      Navigator.of(context).pop();
                                      setState(() {});
                                    }
                                  },
                                )
                              ],
                            );
                          });
                    }
                  },
                  child: Text(
                    'Progress now: ${loadedTask.progress ?? 0}%',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
