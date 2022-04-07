import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/blogs.dart';

class BlogDetailsScreen extends StatefulWidget {
  static const routeName = '/blog-details';

  const BlogDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final blogId = ModalRoute.of(context)?.settings.arguments as String;
    var loadedBlog = Provider.of<Blogs>(
      context,
      listen: false,
    ).findById(int.parse(blogId));

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedBlog.title ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Title: ${loadedBlog.title}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Author: ${loadedBlog.author?.name}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Date: ${DateFormat('yyyy-MM-dd – hh:mm a').format(loadedBlog.date!)}',
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                String url = loadedBlog.url ?? '';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const Text('View Blog'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
