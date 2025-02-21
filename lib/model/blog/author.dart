import 'package:freezed_annotation/freezed_annotation.dart';
part 'author.freezed.dart';
part 'author.g.dart';

@freezed
class Author with _$Author {
  const factory Author({required String username, required String fullName}) =
      _Author;

  factory Author.fromJson(Map<String, Object> json) => _$AuthorFromJson(json);
}
