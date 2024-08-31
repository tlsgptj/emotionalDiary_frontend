import 'package:flutter/material.dart';

class MonthlyViewScreen extends StatefulWidget {
  @override
  _MonthlyViewScreenState createState() => _MonthlyViewScreenState();
}

class _MonthlyViewScreenState extends State<MonthlyViewScreen> {
  int selectedDay = 1;
  int selectedMonth = 1;
  int selectedYear = 2024;
  bool isWritingMode = false; // 작성 모드 여부를 저장하는 변수

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
              // 홈 버튼 클릭 시의 동작 추가
            },
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Icon(
            Icons.archive,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.purple[50], // 배경색
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    // 연도 이전으로 이동 로직
                  },
                ),
                Text(
                  '$selectedYear',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    // 연도 다음으로 이동 로직
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    // 월 이전으로 이동 로직
                  },
                ),
                Text(
                  'January',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    // 월 다음으로 이동 로직
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, // 주간 7일을 보여주는 그리드
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 31, // 최대 31일
                itemBuilder: (BuildContext context, int index) {
                  int day = index + 1;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = day;
                        isWritingMode = true; // 작성 모드로 전환
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedDay == day ? Colors.blue : Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '$day',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (isWritingMode) ...[
              const Divider(height: 30, color: Colors.grey),
              Text(
                'date $selectedYear-$selectedMonth-$selectedDay',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'emotions',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'content',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 작성 내용 저장 로직 추가
                },
                child: const Text('Save'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
