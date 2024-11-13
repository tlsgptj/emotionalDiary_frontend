import 'package:emotional_diary/screens/ArchiveScreen.dart';
import 'package:emotional_diary/screens/LoginScreen.dart';
import 'package:emotional_diary/screens/ResetPassword.dart';
import 'package:emotional_diary/screens/SignUpScreen.dart';
import 'package:emotional_diary/screens/checkScreen.dart';
import 'package:emotional_diary/screens/landing_screen.dart';
import 'package:emotional_diary/screens/writescreen.dart';
import 'package:emotional_diary/screens/MainScreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotional Diary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // 앱의 라우트 설정
      initialRoute: '/',
      routes: {
        '/landing': (context) => HomeScreen(),
        '/write': (context) => WriteItScreen(),
        '/archive': (context) => const ArchiveScreen(),
        '/check': (context) => const Checkscreen(),
        '/main': (context) => MainScreen(),
        '/login': (context) => LoginScreen(),
        '/SignUp': (context) => SignUpscreen(),
        '/ResetPassword': (context) => ResetPasswordScreen(),
      },
    );
  }
}