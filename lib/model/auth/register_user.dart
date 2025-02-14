import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_user.freezed.dart';
part 'register_user.g.dart';

@freezed
class RegisterUser with _$RegisterUser {
  const factory RegisterUser(
      {required String email,
      required String username,
      required String fullName,
      required String password}) = _RegisterUser;

  factory RegisterUser.fromJson(Map<String, Object?> json) =>
      _$RegisterUserFromJson(json);
}
