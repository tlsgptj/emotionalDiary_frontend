import 'package:flutter/material.dart';

class WriteItScreen extends StatefulWidget {
  @override
  _WriteItScreenState createState() => _WriteItScreenState();
}

class _WriteItScreenState extends State<WriteItScreen> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }
  //걍 void랑 Future<void>랑 뭔차이임?
  // void : 동기적으로 실행되는 함수
  // Future<void> : 비동기적으로 실행되는 함수

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
            icon: Icon(Icons.home, color: Colors.black),
            onPressed: () {
              // 홈 버튼 눌렀을 때의 동작 추가
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.edit, color: Colors.black),
          onPressed: () {
            // Edit 버튼 눌렀을 때의 동작 추가
          },
        ),
      ),
      body: Container(
        color: Colors.purple[50], // 배경색
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'How do you feel today?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        const Text('date | ', style: TextStyle(fontSize: 16)),
                        Text(
                          "${_selectedDate.toLocal()}".split(' ')[0],
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'emotions',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'content',
                        border: UnderlineInputBorder(),
                      ),
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // 저장 버튼 클릭 시 동작 추가
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ), backgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10.0),
                        ),
                        child: const Text(
                          'save',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // 파일 가져오기 버튼 클릭 시 동작 추가
              },
              child: const Text(
                'import file >>',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.circle, size: 10, color: Colors.grey),
                SizedBox(width: 8),
                Icon(Icons.circle, size: 10, color: Colors.grey),
                SizedBox(width: 8),
                Icon(Icons.circle, size: 10, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}