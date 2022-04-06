import 'package:e_task/screens/edit_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/task.dart';
import '../screens/task_details_screen.dart';

class TaskItem extends StatelessWidget {
  final String id;
  final String title;
  final int progress;
  final bool isEditFlow;

  const TaskItem(this.id, this.title, this.progress, {this.isEditFlow = false});

  @override
  Widget build(BuildContext context) {
    // Task? task = Provider.of<Task>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ListTile(
        title: SizedBox(
          height: 75,
          child: Card(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: GoogleFonts.lato(fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Text('Progress: $progress%'),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(isEditFlow ? Icons.edit : Icons.remove_red_eye),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          if (isEditFlow) {
            Navigator.of(context).pushNamed(
              EditTaskScreen.routeName,
              arguments: id,
            );
          } else {
            Navigator.of(context).pushNamed(
              TaskDetailsScreen.routeName,
              arguments: id,
            );
          }
        },
      ),
    );
  }
}
