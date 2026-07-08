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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore fs = FirebaseFirestore.instance;
    // fs 객체를 이용해서 db에 접근
    // crud 예시
    // 0. users 컬렉션에 접근 : fs.collection("users");
    // 1. 삽입 : fs.collection("users").add(데이터(맵));
    // 2. 목록 : fs.collection("users").get();
    // 3. 수정 : fs.collection("users").update();
    // 4. 삭제 : fs.collection("users").delete();

    Future<void> addUser() async{
      Map<String, dynamic> user = {
        "name" : "김철수",
        "age" : 20,
        "cdate" : Timestamp.now()
      };
      await fs.collection("users").add(user);
      // await fs.collection("users").add({
      //   "name" : "김철수",
      //   "age" : 20,
      //   "cdate" : Timestamp.now()
      // });

      // 문서 ID 직접 넣는 경우
      // await fs.collection("users").doc("abcd").set(user);
    }

    Future<void> getUserList() async{
      // final snapshot = await fs.collection("users").get();
      final snapshot =
        await fs.collection("users")
            .where("age", isGreaterThan: 20) // age > 20
            // .where("age", isGreaterThanOrEqualTo: 20)
            // .orderBy("age") // age 필드 기준으로 오름차순
            .orderBy("age", descending: true) // age 필드 기준으로 내림차순
            .get();
      // snapshort.docs
      for(var doc in snapshot.docs){
        Map<String, dynamic> user = doc.data();
        print("문서 ID : ${doc.id}, 이름 : ${user["name"]}, 나이 : ${user["age"]}");
      }

    }

    Future<void> updateUser() async{
      await fs.collection("users").doc("Nf2GTJNu9JeVq8gFf60k").update({
        "name" : "박영희",
        "age" : 25
      });
    }

    Future<void> deleteUser() async{
      await fs.collection("users").doc("o7k03e1trcU3aY8pr1UF").delete();
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: addUser,
                  child: Text("추가")
              ),
              ElevatedButton(
                  onPressed: getUserList,
                  child: Text("출력")
              ),
              ElevatedButton(
                  onPressed: updateUser,
                  child: Text("수정")
              ),
              ElevatedButton(
                  onPressed: deleteUser,
                  child: Text("삭제")
              ),
            ],
          ),
        ),
      ),
    );
  }
}

