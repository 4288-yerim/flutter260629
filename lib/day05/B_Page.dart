import 'package:flutter/material.dart';

class BPage extends StatelessWidget {
  final String? msg;
  const BPage({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B 페이지!"),
        // automaticallyImplyLeading: false, // 뒤로가기 버튼
      ),
      body: Center(
        child: Text(msg ?? "B 페이지! 전달 받은 값 없음!"),
      ),
    );
  }
}
