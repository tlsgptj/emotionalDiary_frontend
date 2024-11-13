import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            color: Colors.grey[300],
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PSYCLeD",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text(
                      "logout",
                      style: TextStyle(color: Colors.white),
                    ),
                ),
              ],
            ),
          ),
          Spacer(),
          //중앙 텍스트임
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "How were you today?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                "we're here to hear",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Spacer(),
          //하단 버튼들
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton(Icons.edit, "WRITE IT >>"),
                _buildOptionButton(Icons.archive, "ARCHIVE IT >>"),
                _buildOptionButton(Icons.storage, "CHECK IT"),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildOptionButton(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.black),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}