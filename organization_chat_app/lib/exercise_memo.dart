import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class ExerciseMemo extends StatefulWidget {
  @override
  State<ExerciseMemo> createState() => _ExerciseMemoState();
}

class _ExerciseMemoState extends State<ExerciseMemo>{

  File? _imageFile;
  File? _savedFile;
  String? _selectedFromTime = '시작 시간';
  String? _selectedToTime = '종료 시간';
  final TextEditingController _memocontroller = TextEditingController();


  Future getImage() async {
    print('getImage f.');
    var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
      // _isPicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.0,
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(0xffe49191),
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          _imageFile = _savedFile;
                          _selectedFromTime = '시작 시간';
                          _selectedToTime = '종료 시간';
                          _memocontroller.clear();
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        Text(
                          "오늘의",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffe49191),
                          ),
                        ),
                        Text(
                          "운동",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffe49191),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),


              SizedBox(
                height: 40,
              ),
              Container(
                width: 200,
                  child: InkWell(
                    onTap: () => getImage(),
                    child: _imageFile == null
                        ? Image.asset('img/imageRegister.png')
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(File(_imageFile!.path), fit: BoxFit.cover,),
                    )
                    // fit: BoxFit.cover,
                  ),

                // child: InkWell(
                //   onTap: () => getImage(),
                //   child: _imageFile == null
                //       ? Image.asset('img/imageRegister.png')
                //       : Image.file(File(_imageFile!.path)),
                //   // fit: BoxFit.cover,
                // ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  '운동 시간',
                  style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        child: Text(
                          _selectedFromTime!,
                          style: TextStyle(color: Color(0xff242424)),
                        ),
                        onPressed: () {
                          Future<TimeOfDay?> selectedTime = showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          selectedTime.then((TimeofDay) {
                            setState(() {
                              _selectedFromTime =
                              '${TimeofDay?.hour}:${TimeofDay?.minute}';
                            });
                          });
                        }),
                    Text(
                      '  -  ',
                      style: TextStyle(color: Color(0xff242424)),
                    ),
                    TextButton(
                        child: Text(
                          _selectedToTime!,
                          style: TextStyle(color: Color(0xff242424)),
                        ),
                        onPressed: () {
                          Future<TimeOfDay?> selectedTime = showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          selectedTime.then((TimeofDay) {
                            setState(() {
                              _selectedToTime =
                              '${TimeofDay?.hour}:${TimeofDay?.minute}';
                            });
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  '운동 메모',
                  style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 24.0,
                child: TextField(
                  maxLines: 5,
                  controller: _memocontroller,
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
              DialogButton(
                onPressed: () {
                  setState(() {
                    _savedFile = _imageFile;
                  });
                  Navigator.pop(context);
                },
                color: Color(0xffe49191),
                child: Text(
                  "기록하기",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}