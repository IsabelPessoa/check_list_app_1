import 'package:flutter/material.dart';
import 'package:check_list_app_1/login/login_page.dart';
import 'package:check_list_app_1/sign_up/sing_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Check List Bel',
      home: SingUpScreen(),
    );
  }
}
