import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:microblog_app/model/auth/register_user.dart';
import 'package:microblog_app/service/auth/auth_interceptor.dart';
import 'package:microblog_app/service/auth/refresh_token_policy.dart';
import 'package:microblog_app/service/secure_storage.dart';

import '../model/auth/login_user.dart';
import '../model/blog/blog.dart';

class ApiService {
  final String baseUrl = 'http://microblog.ddev.site/api';
  final secureStorage = SecureStorage();
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

  Future<http.Response> addBlog(Blog blog) async {
    String? token = await secureStorage.readKey('token');
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/blog-admin/add'));
    request.headers.addAll({
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });
    request.fields
        .addAll(blog.toJson().map((k, v) => MapEntry(k, v.toString())));

    request.files.add(http.MultipartFile.fromString('image', blog.image!,
        filename: blog.imagePath));
    var response = await request.send();
    return http.Response.fromStream(response);
  }

  Future<Blog> getBlog(String slug) async {
    http.Response response = await http.get(Uri.parse('$baseUrl/blog/$slug'));
    return Blog.fromJson(jsonDecode(response.body));
  }

  Future<List<Blog>> getUserBlogPosts(String userSlug) async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/blog/by/$userSlug'));
    var dataDecoded = jsonDecode(response.body);
    var data = dataDecoded["data"] as List;
    return data.map((blog) => Blog.fromJson(blog)).toList();
  }
}
