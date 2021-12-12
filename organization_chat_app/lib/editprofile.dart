import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

enum SingingCharacter { man, woman }
enum SingingCharacter2 { open, notopen }

class _EditProfilePageState extends State<EditProfilePage> {
  SingingCharacter? _character;
  SingingCharacter2? _character2;
  File? _image;
  String? nickname;
  double? height; double? curWeight; double? goalWeight;
  int? year; int? month; int? day;
  String? gender;
  bool? public;

  @override
  Widget build(BuildContext context) {
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
          goalWeight = snapshot.data!.docs[0].get('goalWeight');
          year = snapshot.data!.docs[0].get('year');
          month = snapshot.data!.docs[0].get('month');
          day = snapshot.data!.docs[0].get('day');
          gender = snapshot.data!.docs[0].get('gender');
          public = snapshot.data!.docs[0].get('public');
          //print(gender);
          if (gender =='남'){
            _character = SingingCharacter.man;
          } else{
            _character = SingingCharacter.woman;
          }

          if (public == true){
            _character2 = SingingCharacter2.open;
          } else{
            _character2 = SingingCharacter2.notopen;
          }

          return ListView(
            children: <Widget>[Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffe49191),
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.45),
                      const Text("프로필 수정", textAlign: TextAlign.right, style: TextStyle(color: Color(0xffe49191), fontSize: 25, fontWeight: FontWeight.bold)),
                    ],
                  ),
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
                              ? Image.network(snapshot.data!.docs[0].get('imageLocation')).image
                              : Image.file(_image!).image,
                        ),
                        TextButton(
                          child: const Text("사진 변경", style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline,)),
                          onPressed: () {  },
                        ),
                        Row(
                          children: <Widget>[
                            //SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                            const Text("닉네임"),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.135),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: snapshot.data!.docs[0].get('nickname'),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  isDense: true,
                                ),
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
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: snapshot.data!.docs[0].get('height').toString(),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  isDense: true,
                                ),
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
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: snapshot.data!.docs[0].get('curWeight').toString(),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  isDense: true,
                                ),
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
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: snapshot.data!.docs[0].get('goalWeight').toString(),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  isDense: true,
                                ),
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
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: snapshot.data!.docs[0].get('year').toString(),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  isDense: true,
                                ),
                              ),
                            ),
                            const Text(" 년 "),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: snapshot.data!.docs[0].get('month').toString(),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  isDense: true,
                                ),
                              ),
                            ),
                            const Text(" 월 "),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: snapshot.data!.docs[0].get('day').toString(),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  isDense: true,
                                ),
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
                      DocumentReference reference = await FirebaseFirestore
                          .instance
                          .collection('UserDemo')
                          .doc(FirebaseAuth.instance.currentUser!.uid);

                      if (_image != null) {
                        await FirebaseStorage.instance
                            .ref()
                            .child('UserImage')
                            .child(reference.id)
                            .putFile(_image!);

                        String imageLocation = await FirebaseStorage.instance
                            .ref('UserImage/' + reference.id)
                            .getDownloadURL();


                        await reference.update({
                          'uid': FirebaseAuth.instance.currentUser!.uid,
                          'curTime': FieldValue.serverTimestamp(),
                          'nickname': nickname,
                          'year': year,
                          'month': month,
                          'day': day,
                          'height': height,
                          'curWeight': curWeight,
                          'goalWeight': goalWeight,
                          'imageLocation': imageLocation,
                        });
                      }
                      else{
                        await reference.update({
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
                      Navigator.pop(context);
                    }
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
          ]);
        }
      ),
    );
  }
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
