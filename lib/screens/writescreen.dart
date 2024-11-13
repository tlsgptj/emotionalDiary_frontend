import 'package:emotional_diary/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class WriteItScreen extends StatefulWidget {
  @override
  _WriteItScreenState createState() => _WriteItScreenState();
}

class _WriteItScreenState extends State<WriteItScreen> {
  DateTime _selectedDate = DateTime.now();
  File? _image;
  final TextEditingController _emotionsController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // 서버로 일기 데이터 전송
  Future<void> submitDiaryEntry(String date, String emotions, String content) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/diary/write/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'date': date, 'emotions': emotions, 'content': content}),
    );

    if (response.statusCode == 201) {
      print('Diary entry saved successfully');
    } else {
      print('Failed to save diary entry');
    }
  }

  // 날짜 선택
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // 이미지 선택
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // 일기 데이터 저장
  void _saveDiary() {
    String date = _selectedDate.toLocal().toString().split(' ')[0];
    String emotions = _emotionsController.text;
    String content = _contentController.text;

    if (emotions.isNotEmpty && content.isNotEmpty) {
      submitDiaryEntry(date, emotions, content);
    } else {
      print('Please fill in all fields');
    }
  }

  @override
  void dispose() {
    _emotionsController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Your Feelings'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.edit, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.purple[50], // 배경색
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildDiaryForm(),
            const SizedBox(height: 20),
            _buildImagePicker(),
            const SizedBox(height: 20),
            _buildImageDisplay(),
            const SizedBox(height: 20),
            _buildPaginationDots(),
          ],
        ),
      ),
    );
  }

  Widget _buildDiaryForm() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'How do you feel today?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                const Text('date | ', style: TextStyle(fontSize: 16)),
                Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emotionsController,
              decoration: const InputDecoration(
                labelText: 'emotions',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'content',
                border: UnderlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveDiary,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  backgroundColor: Colors.grey[300],
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
                child: const Text('save', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return TextButton(
      onPressed: _pickImage,
      child: const Text(
        'import file >>',
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildImageDisplay() {
    return _image != null
        ? Image.file(_image!, height: 200)
        : const Text('No image selected.');
  }

  Widget _buildPaginationDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Icon(Icons.circle, size: 10, color: Colors.grey),
        SizedBox(width: 8),
        Icon(Icons.circle, size: 10, color: Colors.grey),
        SizedBox(width: 8),
        Icon(Icons.circle, size: 10, color: Colors.grey),
      ],
    );
  }
}
