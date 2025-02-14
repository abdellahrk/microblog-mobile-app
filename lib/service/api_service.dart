import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:microblog_app/model/auth/register_user.dart';

import '../model/auth/login_user.dart';

class ApiService {
  final String baseUrl = 'http://microblog.ddev.site/api';

  Future<http.Response> register(RegisterUser registerUser) {
    var response = http.post(Uri.parse('$baseUrl/register'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(registerUser));
    return response;
  }

  Future<http.Response> login(LoginUser loginUser) {
    var response = http.post(Uri.parse('$baseUrl/login_check'),
        body: jsonEncode(loginUser));
    return response;
  }
}
