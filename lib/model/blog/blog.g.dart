// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlogImpl _$$BlogImplFromJson(Map<String, dynamic> json) => _$BlogImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String?,
      imagePath: json['imagePath'] as String?,
      slug: json['slug'] as String?,
      author: json['author'] == null
          ? null
          : Author.fromJson((json['author'] as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            )),
    );

Map<String, dynamic> _$$BlogImplToJson(_$BlogImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'imagePath': instance.imagePath,
      'slug': instance.slug,
      'author': instance.author,
    };
