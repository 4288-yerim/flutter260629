import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random ran = Random();

  List<int> list = [];
  List<bool> selectedList = [];

  void createBox() {
    List<int> tempList = [];
    List<bool> tempSelectedList = [];

    for (int i = 0; i < 99; i++) {
      tempList.add(ran.nextInt(9) + 1); // 1 ~ 9
      tempSelectedList.add(false);
    }

    setState(() {
      list = tempList;
      selectedList = tempSelectedList;
    });
  }

  void clickBox(int index) {
    // 이미 사라진 빈칸이면 클릭 안 되게 처리
    if (list[index] == 0) {
      return;
    }

    setState(() {
      selectedList[index] = !selectedList[index];

      int sum = getSum();

      if (sum == 10) {
        for (int i = 0; i < selectedList.length; i++) {
          if (selectedList[i] == true) {
            list[i] = 0; // 삭제하지 않고 빈칸 처리
            selectedList[i] = false;
          }
        }
      }

      if (sum > 10) {
        for (int i = 0; i < selectedList.length; i++) {
          selectedList[i] = false;
        }
      }
    });
  }

  int getSum() {
    int sum = 0;

    for (int i = 0; i < list.length; i++) {
      if (selectedList[i] == true) {
        sum += list[i];
      }
    }

    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 9,
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: List.generate(list.length, (index) {
                  // 숫자가 0이면 빈칸처럼 보이게 처리
                  if (list[index] == 0) {
                    return Container(
                      color: Colors.transparent,
                    );
                  }

                  return GestureDetector(
                    onTap: () {
                      clickBox(index);
                    },
                    child: Container(
                      color: selectedList[index]
                          ? Colors.orangeAccent
                          : Colors.green[100],
                      child: Center(
                        child: Text(
                          "${list[index]}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Container(
              height: 80,
              color: Colors.grey[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("현재 합계 : ${getSum()}"),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: createBox,
                    child: const Text("박스 생성"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}