import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../application.dart';
import '../providers/blog_model.dart';
import '../screens/blog_details_screen.dart';

class BlogItem extends StatelessWidget {
  final BlogModel item;

  const BlogItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ListTile(
        title: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          color: Colors.grey[100],
          child: Container(
            height: 150,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  item.title ?? '-',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Author: ${item.author?.name}'),
                Text('Date: ${DateFormat('yyyy-MM-dd – hh:mm a').format(item.date!)}'),
              ],
            ),
          ),
        ),
        onTap: () {
          Application.pushNameWithTransition(
            context,
            BlogDetailsScreen.routeName,
            arguments: item.id.toString(),
            transition: PageTransitionType.rightToLeftWithFade,
          );
        },
      ),
    );
  }
}
