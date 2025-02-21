import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:microblog_app/notifier/blog_post_notifier.dart';
import 'package:provider/provider.dart';

import '../../model/blog/blog.dart';

class BlogPosts extends StatefulWidget {
  const BlogPosts({super.key});

  @override
  State<BlogPosts> createState() => _BlogPostsState();
}

class _BlogPostsState extends State<BlogPosts> {
  late List<Blog> userPostedBlogPosts;
  BlogPostNotifier? blogPostNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogPostNotifier = Provider.of<BlogPostNotifier>(context, listen: false);
    getBlogPosts();
  }

  getBlogPosts() async {
    blogPostNotifier?.getUserPostedBlog('ramadan-abdellah');
    userPostedBlogPosts = blogPostNotifier!.userPostedBlogs!;
    print(userPostedBlogPosts.length);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posted Properties'),
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
            future: blogPostNotifier?.getUserPostedBlog('ramadan-abdellah'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  itemCount: blogPostNotifier!.userPostedBlogs!.length,
                  itemBuilder: (context, index) {
                    var blogPosts = blogPostNotifier!.userPostedBlogs;
                    return InkWell(
                      onTap: () =>
                          context.push('/blog/${blogPosts[index].slug}'),
                      child: ListTile(
                        title: Text(blogPosts![index].title),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
