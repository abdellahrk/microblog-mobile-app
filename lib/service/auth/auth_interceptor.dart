import 'dart:async';
import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:http/src/base_request.dart';
import 'package:http/src/base_response.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';

import '../navigator_service.dart';
import '../secure_storage.dart';

class AuthInterceptor extends InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    SecureStorage storage = SecureStorage();
    try {
      String? token = await storage.readKey('token');

      if (token == null) {
        NavigationService.navigatorKey.currentContext!.go('/login');
        // Navigator.of(NavigationService.navigatorKey.currentContext!)
        //     .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      }
      request.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
    } catch (e) {
      print(e);
    }
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    return response;
  }
}
