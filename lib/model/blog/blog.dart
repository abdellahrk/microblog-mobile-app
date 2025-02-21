import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:microblog_app/model/blog/author.dart';
part 'blog.g.dart';
part 'blog.freezed.dart';

@freezed
class Blog with _$Blog {
  const factory Blog(
      {required String title,
      required String content,
      String? image,
      String? imagePath,
      String? slug,
      Author? author}) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
}
