import 'package:emotional_diary/screens/ArchiveScreen.dart';
import 'package:emotional_diary/screens/checkScreen.dart';
import 'package:emotional_diary/screens/writescreen.dart';
import 'package:flutter/material.dart';

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
                Navigator.pop(context); // 드로어를 닫고
                _showLoginDialog(context); // 로그인 다이얼로그를 표시
              },
            ),
            ListTile(
              title: const Text('Sign in >>'),
              onTap: () {
                Navigator.pop(context); // 드로어를 닫고
                _showSigninDialog(context); // 회원가입 다이얼로그를 표시
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.purple[50], // 전체 배경색
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildButtonCard(Icons.edit, 'Write it', () {
              MaterialPageRoute(builder: (context) => WriteItScreen()),
            }),
            const SizedBox(height: 20),
            _buildButtonCard(Icons.archive, 'Archive it', () {
              Navigator.push(context, ArchiveScreen() as Route<Object?>);
            }),
            const SizedBox(height: 20),
            _buildButtonCard(Icons.pie_chart, 'Check it', () {
              Navigator.push(context, Checkscreen() as Route<Object?>);
            }),
          ],
        ),
      ),
    );
  }

  void _showSigninDialog(BuildContext context) {
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
              const TextField(
                decoration: InputDecoration(labelText: 'Email address'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Password check'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                  _selectDate(context); // 날짜 선택 다이얼로그 호출
                },
                child: const Text('Birthday'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Image.asset('images/sissors.png'),//이거 X버튼으로 수정해야함
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
            ),
            TextButton(
              child: const Text('Sign in'),
              onPressed: () {
                Navigator.of(context).pop(); // 이거 수정해야함 DB에 저장되는 로직으로
              },
            ),
          ],
        );
      },
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      print('Selected Date: ${picked.toLocal()}');
    }
  }

  void _showLoginDialog(BuildContext context) {
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
            children: const <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Email address'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Image.asset('images/sissors.png'),
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.of(context).pop(); // 이거 수정해야함 DB에서 정보 가져와서 로그인되는 로직으로
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
