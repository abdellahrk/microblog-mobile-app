import 'package:flutter/material.dart';
import 'package:microblog_app/screen/auth/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  ElevatedButton(onPressed: () {}, child: Text('Login')),
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
