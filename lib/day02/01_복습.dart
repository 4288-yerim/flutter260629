import 'package:flutter/material.dart'; // Flutter 기본 위젯 불러오기

void main() {
  runApp(const MyApp()); // 앱 실행
}

class MyApp extends StatelessWidget { // 화면 전체를 담당하는 위젯
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { // 화면에 보여줄 UI 작성
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debug 표시 없애기
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.grey // 배경 색
      ),
      home: Scaffold( // 기본 화면 구조
        appBar: AppBar( // 상단
          title: Text( // 텍스트
              "타이틀!",
              style: TextStyle( // 글자 스타일
                fontWeight: FontWeight.w600, // 글자 굵기
                color : Colors.blue, // 색깔
                letterSpacing: 2, // 자간
                decoration: TextDecoration.underline, // 글자 데코 (밑줄)
                decorationColor: Colors.red, // 글자 데코 색깔
                decorationStyle: TextDecorationStyle.dashed, // 글자 데코 스타일 (점선)
              ),
          ),
          actions: [ // AppBar 오른쪽 버튼들
            IconButton(onPressed: (){}, icon: Icon(Icons.settings)), // 설정 아이콘 버튼
            IconButton(onPressed: (){}, icon: Icon(Icons.home)), // 홈 아이콘 버튼
          ],
        ),
        drawer: Drawer(), // 사이드 메뉴
        body: Center( // 중간
          child: Row( // 가로 방향으로 위젯 배치
            children: [
              ElevatedButton( // 기본 버튼
                  onPressed: (){ // 버튼 클릭 시 실행
                    print("버튼 클릭!!"); // 개발자만 보임
                  },
                  child: Text("선택!"), // 버튼 안에 들어갈 글자
                  style: ElevatedButton.styleFrom( // 버튼 스타일
                    backgroundColor: Colors.lightBlueAccent, // 버튼 색
                    foregroundColor: Colors.pinkAccent, // 버튼 글자 색 (선택! 글자)
                    shadowColor: Colors.black, // 그림자 색
                    elevation: 10, // 그림자 크기
                    shape: RoundedRectangleBorder( // 테두리 모서리
                      borderRadius: BorderRadius.circular(10) // 얼마나 둥글게 보일지
                    ),
                    side: BorderSide( // 버튼 테두리
                        color: Color(0xFF830D49), // 테두리 색
                      width: 1 // 테두리 두께
                    )
                  ),
              ),
              // 직접 만든 위젯들
              MyButton(text : Text("안녕?")),
              MyButton(text : Text("ㅋㅋ")),
              MyButton(text : Text("Hello")),
              MyButton(text : Text("Flutter")),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(), // 하단
      ),
    );
  }
}

class MyButton extends StatelessWidget { // 재사용할 버튼 위젯
  final Text text; // 버튼에 들어갈 텍스트
  const MyButton({super.key, required Text this.text}); // text 값을 반드시 받는 생성자

  @override
  Widget build(BuildContext context) { // MyButton에 화면에 어떻게 보일지 작성
    return ElevatedButton(
      onPressed: (){ // 버튼 클릭 시 실행
        print("버튼 클릭!!"); // 개발자만 보임
      },
      child: text, // 전달받은 텍스트를 버튼 안에 표시
      style: ElevatedButton.styleFrom( // 버튼 스타일
          backgroundColor: Colors.lightBlueAccent, // 버튼 색
          foregroundColor: Colors.pinkAccent, // 버튼 글자 색 (선택! 글자)
          shadowColor: Colors.black, // 그림자 색
          elevation: 10, // 그림자 크기
          shape: RoundedRectangleBorder( // 테두리 모서리
              borderRadius: BorderRadius.circular(10) // 얼마나 둥글게 보일지
          ),
          side: BorderSide( // 버튼 테두리
              color: Color(0xFF830D49), // 테두리 색
              width: 1 // 테두리 두께
          )
      ),
    );
  }
}
