import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:microblog_app/model/auth/register_user.dart';
import 'package:microblog_app/screen/auth/login.dart';
import 'package:microblog_app/service/api_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _apiService = ApiService();
  final _secureStorage = FlutterSecureStorage();

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
                    controller: _emailController,
                    decoration: InputDecoration(label: Text('Email')),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(label: Text('Username')),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(label: Text('Fullname')),
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
                    obscuringCharacter: '*',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        print("hello");
                        String email = _emailController.text.toString();
                        String fullName = _fullnameController.text.toString();
                        String username = _usernameController.text.toString();
                        String password = _passwordController.text.toString();

                        final user = RegisterUser(
                            email: email,
                            password: password,
                            fullName: fullName,
                            username: username);
                        var response = await _apiService.register(user);
                        if (response.statusCode != 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Register failed ')));
                        }

                        if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Register successful ')));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                          // var responseData = jsonDecode(response.body);
                          // await _secureStorage.write(
                          //     key: 'token', value: responseData['token']);
                          // await _secureStorage.write(
                          //     key: 'refresh_token',
                          //     value: responseData['refresh_token']);
                        }
                      },
                      child: Text('Sign up ')),
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
                    child: Text("Login"),
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
