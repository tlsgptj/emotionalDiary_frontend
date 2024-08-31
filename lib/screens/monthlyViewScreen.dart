import 'package:flutter/material.dart';

class MonthlyViewScreen extends StatelessWidget {
  const MonthlyViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Your Feelings;'),
        backgroundColor: Colors.purple[50], // 원하는 색상으로 변경 가능
      ),
      body: Center(
        child: const Text(
          'This is the Monthly View Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

