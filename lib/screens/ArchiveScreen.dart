import 'package:emotional_diary/screens/boardViewScreen.dart';
import 'package:emotional_diary/screens/tableViewScreen.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';
import 'monthlyViewScreen.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Your Feelings;'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(
            Icons.archive,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.purple[50], // 전체 배경색
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildButtonCard(Icons.shield_moon, 'Monthly view', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MonthlyViewScreen()),
              );
            }),
            const SizedBox(height: 20),
            _buildButtonCard(Icons.dashboard, 'Table view', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArchiveTableScreen()),
              );
            }),
            const SizedBox(height: 20),
            _buildButtonCard(Icons.content_paste, 'Board view', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EntryListScreen()),
              );
            }),
          ],
        ),
      ),
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
