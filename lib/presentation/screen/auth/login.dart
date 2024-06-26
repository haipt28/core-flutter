import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Welcome to flutter",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.green)),
      ),
    );
  }
}
