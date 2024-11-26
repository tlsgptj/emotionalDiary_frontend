import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert'; //JSON 변환을 위한 패키지

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 사용자 입력값을 저장하기 위한 TextEditingController
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // 로딩 상태 관리
  bool _isLoading = false;

  // Django API 호출
  Future<void> _login() async {
    final url = Uri.parse('https://example.com/api/login/'); // Django API URL
    final body = jsonEncode({
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    setState(() {
      _isLoading = true; // 로딩 상태 활성화
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // 예: 토큰 저장 또는 다음 화면으로 이동
        print('Login Successful: ${data['token']}');
        // TODO: Navigator를 사용하여 다른 화면으로 이동
      } else {
        // 에러 처리
        final errorData = jsonDecode(response.body);
        print('Error: ${errorData['detail']}');
        _showErrorDialog('Login failed: ${errorData['detail']}');
      }
    } catch (e) {
      print('Exception: $e');
      _showErrorDialog('An unexpected error occurred.');
    } finally {
      setState(() {
        _isLoading = false; // 로딩 상태 비활성화
      });
    }
  }
  Future<void> _googleLogin() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        setState(() {
          _isLoading = false;
        });
        return; //사용자가 로그인 취소
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken != null) {
        final response = await http.post(
          Uri.parse('https://example.com/api/google-login/'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'id_token': idToken}),
        );
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          print('Google Login');
        } else {
          final errorData = jsonDecode(response.body);
          _showErrorDialog('Google Login Failed');
        }
      }
    } catch (e) {
      _showErrorDialog("An unexpected error occurred.");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 에러 다이얼로그 표시
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey[300],
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "PSYCLeD",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Let's get started",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'email address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              child: Text("Log in"),
            ),
            SizedBox(height: 20),
            // 추가 텍스트 링크
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "is it your first time?  ",
                  style: TextStyle(color: Colors.white70),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "click here",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Text(
                "forgot password?",
                style: TextStyle(color: Colors.blue),
              ),
            ),

            SizedBox(height: 30),
            // Google 로그인 버튼
            ElevatedButton.icon(
              onPressed: () {},
              icon: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/4/4e/Google_Icon.png',
                // 구글 아이콘 URL
                height: 24,
                width: 24,
              ),
              label: Text(
                "Continue with Google",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

