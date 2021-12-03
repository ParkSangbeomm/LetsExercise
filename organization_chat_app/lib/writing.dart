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
                    const Text("글쓰기", textAlign: TextAlign.right, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.35),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "완료",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffe49191),
                      ),
                      //border: BorderSide(style료: BorderStyle(Color(0xffe49191)))
                    )                  ],
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
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
                          maxLines: 15,
                          decoration: InputDecoration(
                            hintText: "내용을 입력하세요",
                            fillColor: Colors.grey[300],
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.4,),
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "등록 요청하기",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffe49191),
                          ),
                          //border: BorderSide(style: BorderStyle(Color(0xffe49191)))
                        ),
                      )
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