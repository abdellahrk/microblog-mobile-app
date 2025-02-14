// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterUserImpl _$$RegisterUserImplFromJson(Map<String, dynamic> json) =>
    _$RegisterUserImpl(
      email: json['email'] as String,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$RegisterUserImplToJson(_$RegisterUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'fullName': instance.fullName,
      'password': instance.password,
    };
