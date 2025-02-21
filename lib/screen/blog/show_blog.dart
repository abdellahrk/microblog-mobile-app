import 'dart:io';

import 'package:flutter/material.dart';
import 'package:microblog_app/notifier/blog_post_notifier.dart';
import 'package:provider/provider.dart';

import '../../model/blog/blog.dart';

class ShowBlog extends StatefulWidget {
  const ShowBlog({super.key, required this.slug});
  final String slug;

  @override
  State<ShowBlog> createState() => _ShowBlogState();
}

class _ShowBlogState extends State<ShowBlog> {
  late BlogPostNotifier blogPostNotifier;
  Blog? blog;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogPostNotifier = Provider.of<BlogPostNotifier>(context, listen: false);
    getData();
  }

  getData() async {
    await blogPostNotifier.getBlog(widget.slug);
    blog = blogPostNotifier.blog!;
    print(blog);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Blog"),
      ),
      body: Column(children: [
        Center(
            child: FutureBuilder<dynamic>(
                future: blogPostNotifier.getBlog(widget.slug),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Column(
                      children: [Text(blog!.title)],
                    );
                  }

                  return Text('Not found');
                })),
      ]),
    );
  }
}
