import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';

void main() async {
  // Flutter 프레임워크와의 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Firebase 초기화 설정
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  var productNameCtrl = TextEditingController();
  var categoryCtrl = TextEditingController();
  var priceCtrl = TextEditingController();
  var infoNameCtrl = TextEditingController();

  void addUser() async{
    if(productNameCtrl.text.isNotEmpty && categoryCtrl.text.isNotEmpty
        && priceCtrl.text.isNotEmpty && infoNameCtrl.text.isNotEmpty){
      await fs.collection("Product").add({
        "productName" : productNameCtrl.text,
        "category" : categoryCtrl.text,
        "price" : int.parse(priceCtrl.text),
        "info" : infoNameCtrl.text,
      });

      productNameCtrl.clear();
      categoryCtrl.clear();
      priceCtrl.clear();
      infoNameCtrl.clear();
    } else {
      print("빈칸 다 채우셈");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("제품 등록")
          ),
          backgroundColor: Colors.pink[100],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("제품 정보", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  controller: productNameCtrl,
                  decoration: InputDecoration(
                      labelText: "제품명",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: categoryCtrl,
                  decoration: InputDecoration(
                      labelText: "카테고리",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: priceCtrl,
                  decoration: InputDecoration(
                      labelText: "가격",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
                SizedBox(height: 10,),
                Text("상세 설명", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  controller: infoNameCtrl,
                  maxLines: 4,
                  decoration: InputDecoration(
                      labelText: "제품에 대한 설명을 입력해주세요",
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: addUser,
                  child: Container(
                    height: 50, width: 420,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '제품 등록하기',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}