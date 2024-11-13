import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EntryListScreen extends StatefulWidget {
  @override
  _EntryListScreenState createState() => _EntryListScreenState();
}

class _EntryListScreenState extends State<EntryListScreen> {
  List<UserEntry> _entries = [];

  @override
  void initState() {
    super.initState();
    fetchEntries();
  }

  Future<void> fetchEntries() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/blog-posts/'),
      headers: {
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN',  // 사용자 토큰 필요
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        _entries = data.map((entry) => UserEntry.fromJson(entry)).toList();
      });
    } else {
      throw Exception('Failed to load entries');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Your Feelings'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.black),
            onPressed: () {
              // 홈 버튼 클릭 시 동작 추가
            },
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(
            Icons.archive,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.purple[50],
        padding: EdgeInsets.all(16.0),
        child: _entries.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _entries.length,
          itemBuilder: (context, index) {
            final entry = _entries[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  '${entry.date}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${entry.emotion}'),
                    SizedBox(height: 5),
                    Text('${entry.content}'),
                  ],
                ),
                trailing: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.pink],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // 이전 페이지 로직 추가
              },
            ),
            SizedBox(width: 10),
            Text('1 2 3 4 5'),  // 페이지네이션 구현 필요
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                // 다음 페이지 로직 추가
              },
            ),
          ],
        ),
      ),
    );
  }
}

