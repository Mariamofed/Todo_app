import 'package:flutter/material.dart';
import 'package:todoapp/home_screen.dart';
// import 'package:todoapp/home_screen.dart';
import 'package:todoapp/welcome_screen.dart';

void main() async {
  runApp(const MainApp(username: ''));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.username});
  final String? username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: username == null ? WelcomeScreen() : HomeScreen(name: ''),
    );
  }
}
