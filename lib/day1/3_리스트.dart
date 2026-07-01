import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : ListView(
          children: [
            ListTile(
            leading: Image.asset("RYAN_1.jpg", width: 70, height: 70,),
            title: Text("귀여운 라이언~", style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("정말 정말 귀여워요~"),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
            onTap: (){
              print("클릭 됨!");
             },
            ),
            Divider(height: 3, color: Colors.black45),
            ListTile(
              leading: Image.asset("RYAN_2.jpg", width: 70, height: 70,),
              title: Text("귀여운 라이언~", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("정말 정말 귀여워요~"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              onTap: (){
                print("클릭 됨!");
              },
            ),
            Divider(height: 3, color: Colors.black45),
            ListTile(
              leading: Image.asset("RYAN_3.jpg", width: 70, height: 70,),
              title: Text("귀여운 라이언~", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("정말 정말 귀여워요~"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              onTap: (){
                print("클릭 됨!");
              },
            ),
            Divider(height: 3, color: Colors.black45),
          ],
        )
      )
    );
  }
}
