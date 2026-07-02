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
        body: Row(
          children: [
            Flexible(flex: 1, child: Container(color: Colors.red,),),
            Flexible(flex: 2, child: Column(
              children: [
                Flexible(flex : 1, child: Container(color: Colors.grey),),
                Flexible(flex : 2, child: Container(color: Colors.purple),),
                Flexible(flex : 1, child: Container(color: Colors.grey),),
              ]
            ),),
            Flexible(flex: 1,child: Container(color: Colors.green,),),
          ],
        ),
      ),
    );
  }
}
