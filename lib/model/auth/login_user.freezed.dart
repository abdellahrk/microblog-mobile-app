// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginUser _$LoginUserFromJson(Map<String, dynamic> json) {
  return _LoginUser.fromJson(json);
}

/// @nodoc
mixin _$LoginUser {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LoginUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginUserCopyWith<LoginUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUserCopyWith<$Res> {
  factory $LoginUserCopyWith(LoginUser value, $Res Function(LoginUser) then) =
      _$LoginUserCopyWithImpl<$Res, LoginUser>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginUserCopyWithImpl<$Res, $Val extends LoginUser>
    implements $LoginUserCopyWith<$Res> {
  _$LoginUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginUserImplCopyWith<$Res>
    implements $LoginUserCopyWith<$Res> {
  factory _$$LoginUserImplCopyWith(
          _$LoginUserImpl value, $Res Function(_$LoginUserImpl) then) =
      __$$LoginUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginUserImplCopyWithImpl<$Res>
    extends _$LoginUserCopyWithImpl<$Res, _$LoginUserImpl>
    implements _$$LoginUserImplCopyWith<$Res> {
  __$$LoginUserImplCopyWithImpl(
      _$LoginUserImpl _value, $Res Function(_$LoginUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$LoginUserImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginUserImpl implements _LoginUser {
  const _$LoginUserImpl({required this.username, required this.password});

  factory _$LoginUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginUserImplFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginUser(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUserImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  /// Create a copy of LoginUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginUserImplCopyWith<_$LoginUserImpl> get copyWith =>
      __$$LoginUserImplCopyWithImpl<_$LoginUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginUserImplToJson(
      this,
    );
  }
}

abstract class _LoginUser implements LoginUser {
  const factory _LoginUser(
      {required final String username,
      required final String password}) = _$LoginUserImpl;

  factory _LoginUser.fromJson(Map<String, dynamic> json) =
      _$LoginUserImpl.fromJson;

  @override
  String get username;
  @override
  String get password;

  /// Create a copy of LoginUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginUserImplCopyWith<_$LoginUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
