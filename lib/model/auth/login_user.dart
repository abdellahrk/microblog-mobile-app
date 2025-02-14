import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_user.freezed.dart';
part 'login_user.g.dart';

@freezed
class LoginUser with _$LoginUser {
  const factory LoginUser(
      {required String username, required String password}) = _LoginUser;

  factory LoginUser.fromJson(Map<String, Object> json) =>
      _$LoginUserFromJson(json);
}
