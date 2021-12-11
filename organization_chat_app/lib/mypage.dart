import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'editprofile.dart';
import 'management.dart';
import 'dart:io';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    final yearController = TextEditingController();
    final monthController = TextEditingController();
    final dayController = TextEditingController();
    final weightController = TextEditingController();
    final muscleController = TextEditingController();
    final fatController = TextEditingController();
    File? _image;
    String? nickname;
    double? height; double? curWeight; double? goalWeight;
    int? year; int? month; int? day;

    return Scaffold(
      body: StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('UserDemo')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid,)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          nickname = snapshot.data!.docs[0].get('nickname');
          height = snapshot.data!.docs[0].get('height');
          curWeight = snapshot.data!.docs[0].get('curWeight');
          year = snapshot.data!.docs[0].get('year');
          month = snapshot.data!.docs[0].get('month');
          day = snapshot.data!.docs[0].get('day');
          return Padding(
            padding: EdgeInsets.fromLTRB(swidth*0.05, sheight*0.05, swidth*0.05, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  drawDivider(swidth: swidth, title: "프로필 정보"),
                  const SizedBox(height: 15),
                  // 프로필 정보 (사진, 이름, 키, 몸무게)
                  StreamBuilder<Object>(
                    stream: FirebaseFirestore.instance
                        .collection('UserDemo')
                        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid,)
                        .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('img/jojungsuk.PNG'),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(nickname!, style: TextStyle(fontSize: 20)),
                              Text(year.toString() + ". " + month.toString() + ". " + day.toString(), style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
                              Text(height.toString() + "cm, " + curWeight.toString() + "kg", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
                            ]
                          )
                        ],
                      );
                    }
                  ),
                  const SizedBox(height: 13),
                  // 버튼 3개
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EditProfilePage()),
                            );
                          },
                            child: const Text("프로필 수정"),
                            // borderRadius: BorderRadius.circular(50),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(115, 36),
                              primary: const Color(0xffedb9b9),
                              textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                            ),                        // textStyle: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      const SizedBox(width:10),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ManagementPage()),
                          );
                        },
                        child: const Text("친구 관리"),

                        // borderRadius: BorderRadius.circular(50),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(108, 36),
                          primary: const Color(0xffedb9b9),
                          textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                        ),                        // textStyle: TextStyle(fontSize: 17, color: Colors.white),

                      ),
                      const SizedBox(width:10),
                      ElevatedButton(
                        onPressed: () {
                          Alert(
                              context: context,
                              //title: Text("기록 추가", style: const TextStyle(color: Color(0xffe49191))),
                              content: Column(
                                children: <Widget>[
                                  const Text("기록 추가", style: TextStyle(color: Color(0xffe49191), fontWeight: FontWeight.bold)),
                                  SizedBox(height: 25),
                                  Row(
                                    children: <Widget>[
                                      const Text("날짜", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.125,
                                        child: TextField(
                                          controller: yearController,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(0.0),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                      const Text(" 년  ", style: TextStyle(fontSize: 14)),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.125,
                                        child: TextField(
                                          controller: monthController,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(0.0),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                      const Text(" 월  ", style: TextStyle(fontSize: 14)),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.125,
                                        child: TextField(
                                          controller: dayController,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(0.0),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                      const Text(" 일", style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                                  Row(
                                    children: <Widget>[
                                      //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                                      const Text("체중", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        child: TextField(
                                          controller: weightController,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(0.0),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                      const Text("(kg)", style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                                  Row(
                                    children: <Widget>[
                                      //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                                      const Text("골격근", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        child: TextField(
                                          controller: muscleController,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(0.0),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                      const Text("(kg)", style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                                  Row(
                                    children: <Widget>[
                                      //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                                      const Text("체중", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        child: TextField(
                                          controller: fatController,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(0.0),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                      const Text("(kg)", style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "저장하기",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  color: const Color(0xffe49191),
                                  //border: BorderSide(style: BorderStyle(Color(0xffe49191)))
                                )
                              ]).show();
                        },
                        child: const Text("기록 추가"),

                        // borderRadius: BorderRadius.circular(50),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(108, 36),
                          primary: const Color(0xffedb9b9),
                          textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                        ),                        // textStyle: TextStyle(fontSize: 17, color: Colors.white),

                      ),
                        ]),
                  const SizedBox(height: 15,),
                  drawDivider(swidth: swidth, title: "신체 상태"),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      SizedBox(width: 5),
                      // TODO : 닉네임 넣기
                      Text("류준열", style: TextStyle(fontSize: 18)),
                      Text(" 님의 비만도 결과  ", style: TextStyle(fontSize: 18)),
                      // TODO : 비만도 결과 숫자 넣기
                      Text("20.9", style: TextStyle(fontSize: 30))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 70,
                        color: const Color(0xfff9e9e9),
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        color: const Color(0xfff4d4d4),
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        color: const Color(0xfff1c8c8),
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        color: const Color(0xffecb2b2),
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        color: const Color(0xffe69c9c),
                      ),
                    ],
                  )
                ]

              )


          );
        }
      ));


  }

}

class drawDivider extends StatelessWidget {

  final double swidth;
  final String title;

  drawDivider({
    required this.swidth,
    required this.title,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
    // crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [

      // 동그라미
      Container(
        // margin: EdgeInsets.fromTRB(15, 20, 0, 0),
        height: 35,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xffe49191),
        ),
        child: Center(
          child: Text(title, style: const TextStyle(fontSize: 17, color: Colors.white)),
        ),
      ),

      // 선
      Container(
        // margin: EdgeInsets.only(top: 17),
        height: 2.0,
        width: swidth*0.9-110,
        color: const Color(0xffe49191),
      )
    ],
    );
  }
}