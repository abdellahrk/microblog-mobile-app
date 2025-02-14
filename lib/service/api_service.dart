import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:microblog_app/model/auth/register_user.dart';
import 'package:microblog_app/service/auth/auth_interceptor.dart';
import 'package:microblog_app/service/auth/refresh_token_policy.dart';

import '../model/auth/login_user.dart';

class ApiService {
  final String baseUrl = 'http://microblog.ddev.site/api';
  final authRequest = InterceptedClient.build(
      interceptors: [AuthInterceptor()], retryPolicy: RefreshTokenPolicy());

  Future<http.Response> register(RegisterUser registerUser) {
    var response = http.post(Uri.parse('$baseUrl/register'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(registerUser));
    return response;
  }

  Future<http.Response> login(LoginUser loginUser) {
    var response = http.post(Uri.parse('$baseUrl/login_check'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(loginUser));
    return response;
  }

  Future<http.Response> refreshToken(String token) {
    var response = http.post(Uri.parse('$baseUrl/token/refresh'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(token));
    return response;
  }
}
