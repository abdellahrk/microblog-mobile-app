import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:microblog_app/model/auth/login_user.dart';
import 'package:microblog_app/screen/auth/register.dart';
import 'package:microblog_app/screen/dashboard/home.dart';
import 'package:microblog_app/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _apiService = ApiService();
  final _secureStorage = FlutterSecureStorage();
  final SharedPreferencesAsync _sharedPref = SharedPreferencesAsync();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Welcome'),
            Icon(Icons.person),
          ],
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(45),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Title(
                    color: Colors.black,
                    child: Text("Welcome To MicroBlog",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(label: Text('Username')),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      label: Text('Password'),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "forgot password",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        var user = LoginUser(
                            username: _usernameController.text.toString(),
                            password: _passwordController.text.toString());
                        var response = await _apiService.login(user);
                        var responseData = jsonDecode(response.body);
                        if (response.statusCode != 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login failed")));
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login successful")));

                        await _secureStorage.write(
                            key: 'token', value: responseData['token']);
                        await _secureStorage.write(
                            key: 'refresh_token',
                            value: responseData['refresh_token']);
                        await _sharedPref.setString(
                            'fullName', responseData['user']['fullName']);
                        await _sharedPref.setInt(
                            'user_id', responseData['user']['id']);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      },
                      child: Text('Login')),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: Text("Sign up"),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    )));
  }
}
