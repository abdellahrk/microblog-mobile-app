import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:microblog_app/service/api_service.dart';

class RefreshTokenPolicy extends RetryPolicy {
  @override
  FutureOr<bool> shouldAttemptRetryOnResponse(BaseResponse response) async {
    final apiService = ApiService();
    final secureStorage = FlutterSecureStorage();
    if (response.statusCode == 401) {
      String? token = await secureStorage.read(key: 'refresh_token');
      var response = await apiService.refreshToken(token!);
      if (response.statusCode != 200) {
        return false;
      }
      var responseDate = jsonDecode(response.body);
      await secureStorage.write(key: 'token', value: responseDate['token']);
      return true;
    }
    return false;
  }
}
