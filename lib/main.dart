import 'package:flutter/material.dart';
import 'package:wri_mobile/screens/home_screen.dart';
import 'package:wri_mobile/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: AppBarTheme(color: Colors.grey[100])),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
