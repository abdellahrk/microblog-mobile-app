import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Column(
        children: [
          Text("Welcome to MicroBlog"),
          SizedBox(
            height: 20,
          ),
          InkWell(
            child: Text("Login"),
            onTap: () {
              context.goNamed('login');
            },
          )
        ],
      ),
    );
  }
}
