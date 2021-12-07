import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';

import 'navigationbar.dart';

class InitProfilePage extends StatefulWidget {
  const InitProfilePage({Key? key}) : super(key: key);

  @override
  State<InitProfilePage> createState() => _InitProfilePageState();
}

enum SingingCharacter { man, woman }
enum SingingCharacter2 { open, notopen }

class _InitProfilePageState extends State<InitProfilePage> {
  final nicknameController = TextEditingController();
  final heightController = TextEditingController();
  final curWeightController = TextEditingController();
  final goalWeightController = TextEditingController();
  final yearController = TextEditingController();
  final monthController = TextEditingController();
  final dayController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.man;
  SingingCharacter2? _character2 = SingingCharacter2.open;
  File? _image;
  String? nickname;
  double? height; double? curWeight; double? goalWeight;
  int? year; int? month; int? day;
  String? gender;
  bool? public;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: <Widget>[Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    MediaQuery.of(context).size.width * 0.05,
                    0.0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width * 0.15),
                    Text("운동", style: TextStyle(color: Color(0xffe49191), fontWeight: FontWeight.bold, fontSize: 30, height: 0)),
                    Text("하자", style: TextStyle(color: Color(0xffe49191), fontWeight: FontWeight.bold, fontSize: 30)),
                  ]
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    MediaQuery.of(context).size.width * 0.05,
                    0.0),
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: _image == null
                            ? AssetImage('img/default_image.jpg')
                            : Image.file(_image!).image,
                      ),
                      TextButton(
                        child: const Text("사진 변경", style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline,)),
                        onPressed: () async {
                          final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

                          setState(() {
                            if (pickedFile != null) {
                              _image = File(pickedFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        },
                      ),
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                          const Text("닉네임"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.135),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: nicknameController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                isDense: true,
                              ),
                              onChanged: (value) {
                                nickname = value;
                              }
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.05,),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        //SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                        const Text("성별"),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.13),
                        SizedBox(
                          width: 140,
                          child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio<SingingCharacter>(
                                        activeColor: Colors.grey,
                                        value: SingingCharacter.man,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                            gender = "남";
                                          });
                                        },
                                      ),
                                      const Expanded(child: Text('남')),
                                    ],
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio<SingingCharacter>(
                                        activeColor: Colors.grey,
                                        value: SingingCharacter.woman,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                            gender = "여";
                                          });
                                        },
                                      ),
                                      const Expanded(child: Text('여'))
                                    ],
                                  ),
                                  flex: 1,
                                ),
                              ]),
                        ),
                      ]),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.05,),
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                          const Text("키"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: heightController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                isDense: true,
                              ),
                              onChanged: (value) {
                                height = double.parse(value);
                              }
                            ),
                          ),
                          const Text("(cm)"),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.08,),
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          const Text("현재 체중"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.095),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: TextField(
                                textAlign: TextAlign.center,
                                controller: curWeightController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  isDense: true,
                                ),
                                onChanged: (value) {
                                  curWeight = double.parse(value);
                                }
                            ),
                          ),
                          const Text("(kg)"),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.08,),
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          const Text("목표 체중"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.095),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: goalWeightController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                isDense: true,
                                ),
                              onChanged: (value) {
                                goalWeight = double.parse(value);
                              }
                            ),
                          ),
                          const Text("(kg)"),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.05,),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        //SizedBox(width: MediaQuery.of(context).size.width * 0.0),
                        const Text("키/체중 공개  "),
                        SizedBox(
                          width: 180,
                          child: Row(children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<SingingCharacter2>(
                                    activeColor: Colors.grey,
                                    value: SingingCharacter2.open,
                                    groupValue: _character2,
                                    onChanged: (SingingCharacter2? value) {
                                      setState(() {
                                        _character2 = value;
                                        public = true;
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text('공개')),
                                ],
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<SingingCharacter2>(
                                    activeColor: Colors.grey,
                                    value: SingingCharacter2.notopen,
                                    groupValue: _character2,
                                    onChanged: (SingingCharacter2? value) {
                                      setState(() {
                                        _character2 = value;
                                        public = false;
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text('비공개'))
                                ],
                              ),
                              flex: 1,
                            ),
                          ]),
                        ),
                      ]),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.05,),
                      Row(
                        children: const <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          Text("위치 설정  "),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.08,),
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          const Text("생년월일"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: yearController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                isDense: true,
                              ),
                              onChanged: (value) {
                                year = int.parse(value);
                              }
                            ),
                          ),
                          const Text(" 년 "),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: monthController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                isDense: true,
                              ),
                              onChanged: (value) {
                                month = int.parse(value);
                              }
                            ),
                          ),
                          const Text(" 월 "),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: dayController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                isDense: true,
                              ),
                              onChanged: (value) {
                                day = int.parse(value);
                              }
                            ),
                          ),
                          const Text(" 일"),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (nickname != null && year != null && month != null && day != null && height != null && curWeight != null && goalWeight != null){
                    if (_image != null) {
                      DocumentReference reference = await FirebaseFirestore.instance
                          .collection('UserDemo')
                          .doc(FirebaseAuth.instance.currentUser!.uid,);

                      await FirebaseStorage.instance
                          .ref()
                          .child('UserImage')
                          .child(reference.id)
                          .putFile(_image!);

                      String imageLocation = await FirebaseStorage.instance
                          .ref('UserImage/' + reference.id)
                          .getDownloadURL();

                      await reference.set({
                        'uid': FirebaseAuth.instance.currentUser!.uid,
                        'curTime': FieldValue.serverTimestamp(),
                        'nickname': nickname,
                        'year': year,
                        'month': month,
                        'day': day,
                        'height': height,
                        'curWeight': curWeight,
                        'goalWeight': goalWeight,
                        'gender': gender,
                        'public': public,
                        'imageLocation': imageLocation,
                      });
                    }
                    else{
                      DocumentReference reference = await FirebaseFirestore.instance
                          .collection('UserDemo')
                          .doc(FirebaseAuth.instance.currentUser!.uid);

                      await reference.set({
                        'uid': FirebaseAuth.instance.currentUser!.uid,
                        'curTime': FieldValue.serverTimestamp(),
                        'nickname': nickname,
                        'year': year,
                        'month': month,
                        'day': day,
                        'height': height,
                        'curWeight': curWeight,
                        'goalWeight': goalWeight,
                      });
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Navigationbar()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(top: 6.5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  color: Color(0xffe49191),
                  child: const Text("시작하기", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ]),
    );
  }
  // Future<File> getImageFileFromAssets(String path) async {
  //   final byteData = await rootBundle.load('$path');
  //
  //   final file = File('${(await getTemporaryDirectory()).path}/$path');
  //   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //
  //   return file;
  // }
}

class friendslist extends StatefulWidget {
  const friendslist({Key? key}) : super(key: key);

  @override
  _friendslistState createState() => _friendslistState();
}

class _friendslistState extends State<friendslist> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      prototypeItem: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('img/profile.jpeg'),
          ),
          SizedBox(width: 15),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("류준열", style: TextStyle(fontSize: 20)),
                Text("1990. 10. 10", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
                Text("183cm, 80kg", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
              ]
          )
        ],
      ),
    );
  }
}
