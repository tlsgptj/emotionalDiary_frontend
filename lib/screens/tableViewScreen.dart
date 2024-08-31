import 'package:flutter/material.dart';

class ArchiveTableScreen extends StatelessWidget {
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
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(
            Icons.archive,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.purple[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5, // 예제 데이터 수량
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: false, // 초기값 설정
                            onChanged: (bool? value) {
                              // 체크박스 상태 변경 로직
                            },
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text('Jun.31 8:00PM', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    SizedBox(width: 8.0),
                                    VerticalDivider(color: Colors.black, thickness: 1),
                                    SizedBox(width: 8.0),
                                    Expanded(
                                      child: Text('#Playful / I went to ...', style: TextStyle(fontSize: 16)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 20, color: Colors.black),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {
                    // 전체 파일 내보내기 체크박스 로직
                  },
                ),
                const Text('export files'),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () {
                    // 파일 다운로드 로직
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.),
                  onPressed: () {
                    // 인스타그램 공유 로직
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // 트위터 또는 공유 로직
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ArchiveTableScreen(),
  ));
}
