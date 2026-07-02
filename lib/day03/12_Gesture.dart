import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onTap: (){
            print("Tap!");
          },
          onDoubleTap: (){
            print("Double Tap!");
          },
          onLongPress: (){
            Fluttertoast.showToast(
                msg: "안녕하세요!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                fontSize: 20.0
            );
          },
          child: Image.asset("RYAN_1.jpg"),
        ),
      ),
    );
  }
}
