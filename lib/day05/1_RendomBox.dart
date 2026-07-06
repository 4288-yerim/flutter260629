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
  List<Widget> list = [];
  int nextNum = 1;
  void createBox(){
    List<Widget> tempList = [];
    nextNum = 1;
    for(int i=1; i<=10; i++){
      int boxNum = i;
      tempList.add(
          Positioned(
              // ran.nextDouble() -> 0.0 ~ 1.0
              left: ran.nextDouble() * (MediaQuery.of(context).size.width - 50),
              top: ran.nextDouble() * (MediaQuery.of(context).size.height - 100),
              child: GestureDetector(
                onTap: (){
                  if (boxNum == nextNum) {
                    setState(() {
                      list.removeAt(0);
                      nextNum++;
                    });
                  } else {
                    print("순서 그거 아님");
                  }
                },
                child: Container(
                  width: 50, height: 50,
                  color: Colors.green[100],
                  child: Center(
                    child: Text("$i"),
                  ),
                ),
              ),
          )
      );
    }
    setState(() {
      list = tempList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: list,
              ),
            ),
            Container(
              height: 50, color: Colors.grey[100],
              child: Center(
                child: ElevatedButton(
                    onPressed: createBox,
                    child: Text("랜덤 박스 생성!")
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
