import 'package:flutter/foundation.dart';
import 'package:microblog_app/model/blog/blog.dart';
import 'package:microblog_app/service/api_service.dart';

class BlogPostNotifier extends ChangeNotifier {
  final apiService = ApiService();
  bool loading = false;
  Blog? blog;
  List<Blog>? userPostedBlogs;

  getBlog(String slug) async {
    loading = true;
    blog = await apiService.getBlog(slug);
    notifyListeners();
    loading = true;
  }

  getUserPostedBlog(String userSlug) async {
    loading = true;
    userPostedBlogs = await apiService.getUserBlogPosts(userSlug);
    notifyListeners();
    loading = false;
  }
}
