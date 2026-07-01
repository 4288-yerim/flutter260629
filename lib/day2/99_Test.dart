import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'C', '(', '%', '/',
      '7', '8', '9', '*',
      '4', '5', '6', '-',
      '1', '2', '3', '+',
      '0', '00', '.', '='
    ];
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
            ),
          itemCount: labels.length,
          itemBuilder: (context, index) {
            return Container(
              color: (index <= 2) || index % 4 == 3 ? Colors.lightBlueAccent[100] : Colors.grey[300],
              child: Center(
                child: Text(labels[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
