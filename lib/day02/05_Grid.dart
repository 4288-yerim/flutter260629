import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10, // 좌우 간격
                mainAxisSpacing: 10, // 위 아래 간격
            ),
            itemCount: 10, // db에서 가져온 랭스
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blue[100 * ((index % 9) + 1)], // 색상 index값에 따라 넣기
                // 색상 값이 900까지기 때문에 다음과 같은 계산식으로 10번째는 1번과 같은 색상 적용
                child: Center(
                    child: Text(
                      "${index+1}", style: TextStyle(color: Colors.white),
                      // ""로 감싸서 문자로, ${계산식} -> ${}안에 있는 걸 계산해서 문자로 출력
                    )
                ),
              );
            },
        ),
      ),
    );
  }
}
