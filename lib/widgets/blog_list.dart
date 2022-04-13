import 'package:e_task/widgets/blog_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/blogs.dart';

class BlogList extends StatefulWidget {
  const BlogList({Key? key}) : super(key: key);

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  Future<void> _refreshBlogs(BuildContext ctx, String? dateAfter) async {
    Provider.of<Blogs>(ctx, listen: false).fetchAndSetBlogs(selectedDate.toString());
  }

  final dateAfterController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    dateAfterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blogData = Provider.of<Blogs>(context);
    final blogs = blogData.blogList;

    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 5, left: 20.0, right: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: TextField(
                      enabled: false,
                      controller: dateAfterController,
                      decoration: InputDecoration(
                        labelText: "Blogs after date:",
                        // hintText: "Blogs after date:",
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          onPressed: dateAfterController.clear,
                          icon: const Icon(Icons.date_range),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: blogs.length,
              itemBuilder: (ctx, i) {
                double mWidth =
                    MediaQuery.of(context).size.width * 0.8 > 500 ? 500 : MediaQuery.of(context).size.width * 0.8;
                return ChangeNotifierProvider.value(
                  value: blogs[i],
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: mWidth,
                    child: BlogItem(item: blogs[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        dateAfterController.text = DateFormat('yyyy-MM-dd').format(selected);
        _refreshBlogs(context, selectedDate.toString());
        _scrollController.animateTo(
          0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      });
    }
  }
}
