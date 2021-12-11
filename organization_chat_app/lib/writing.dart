import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Writing extends StatefulWidget {
  const Writing({Key? key}) : super(key: key);

  @override
  State<Writing> createState() => _WritingState();
}

File? _imageFile;
enum SingingCharacter { man, woman }
enum SingingCharacter2 { open, notopen }

class _WritingState extends State<Writing> {
  final nicknameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final yearController = TextEditingController();
  final monthController = TextEditingController();
  final dayController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.man;
  SingingCharacter2? _character2 = SingingCharacter2.open;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                        Icons.cancel_outlined,
                        color: Color(0xffe49191),
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                    const Text("글쓰기", textAlign: TextAlign.right, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.35),
                    ],
                ),
              ),
              Padding(

                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.width * 0.05,
                    0.0),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        child: InkWell(
                          onTap: () => getImage(),
                          child: _imageFile == null
                              ? Image.asset('img/imageRegister.png')
                              : Image.file(File(_imageFile!.path)),
                          // fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          const Text("카테고리"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.67,
                            child: TextField(
                              controller: weightController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          const Text("제목", style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.14),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.67,
                            child: TextField(
                              controller: weightController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 32, 0, 32),
                        height: 5 * 24.0,
                        child: TextField(
                          maxLines: 5,
                          cursorColor: Color(0xffe49191),
                          decoration: InputDecoration(
                            hintText: '운동 기록을 메모해주세요.',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff8b8a8a),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff8b8a8a),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "완료",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffe49191),
                          ),
                          //border: BorderSide(style: BorderStyle(Color(0xffe49191)))
                        ),
                      ),
                    ]
                    ,
                  ),
                ),
              ),
            ],
          ),
          ]),
    );
  }

  Future getImage() async {
    print('getImage f.');
    var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
      // _isPicked = true;
    });
  }
}