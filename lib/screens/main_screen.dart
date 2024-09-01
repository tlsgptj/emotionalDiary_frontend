import 'package:emotional_diary/screens/writescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ArchiveScreen.dart';
import 'checkScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore your feelings;'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Log in >>'),
              onTap: () {
                Navigator.pop(context);
                _showLoginDialog(context);
              },
            ),
            ListTile(
              title: const Text('Sign in >>'),
              onTap: () {
                Navigator.pop(context);
                _showSigninDialog(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.purple[50],
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildButtonCard(Icons.edit, 'Write it', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WriteItScreen()));
            }),
            const SizedBox(height: 20),
            _buildButtonCard(Icons.archive, 'Archive it', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ArchiveScreen()));
            }),
            const SizedBox(height: 20),
            _buildButtonCard(Icons.pie_chart, 'Check it', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Checkscreen()));
            }),
          ],
        ),
      ),
    );
  }

  void _showSigninDialog(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Hello, welcome here'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email address'),
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Sign in'),
              onPressed: () async {
                final response = await http.post(
                  Uri.parse('http://your-django-server-url/api/register/'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    'username': usernameController.text,
                    'password': passwordController.text,
                    'email': emailController.text,
                  }),
                );

                if (response.statusCode == 201) {
                  // 성공적으로 회원가입이 완료됨
                  Navigator.of(context).pop();
                } else {
                  // 실패 처리
                  print('Failed to register');
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showLoginDialog(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Welcome Back!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                final response = await http.post(
                  Uri.parse('http://your-django-server-url/api/login/'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    'username': usernameController.text,
                    'password': passwordController.text,
                  }),
                );

                if (response.statusCode == 200) {
                  // JWT 토큰을 받아옴
                  final Map<String, dynamic> data = jsonDecode(response.body);
                  final String token = data['access'];
                  // 로그인 성공 처리
                  Navigator.of(context).pop();
                } else {
                  // 실패 처리
                  print('Failed to login');
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildButtonCard(IconData icon, String text, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

