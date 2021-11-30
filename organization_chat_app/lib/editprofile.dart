import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

enum SingingCharacter { man, woman }
enum SingingCharacter2 { open, notopen }

class _EditProfilePageState extends State<EditProfilePage> {
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
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('img/profile.jpeg'),
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
                          child: TextField(
                            controller: nicknameController,
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
                          child: TextField(
                            controller: heightController,
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
                        const Text("목표 체중"),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.095),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: TextField(
                            controller: weightController,
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
                          child: TextField(
                            controller: yearController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              isDense: true,
                            ),
                          ),
                        ),
                        const Text(" 년 "),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: TextField(
                            controller: monthController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              isDense: true,
                            ),
                          ),
                        ),
                        const Text(" 월 "),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: TextField(
                            controller: dayController,
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
          ],
        ),
      ]),
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
