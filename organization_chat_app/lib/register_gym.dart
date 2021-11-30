import 'package:flutter/material.dart';

class RegisterGym extends StatefulWidget {
  const RegisterGym({Key? key}) : super(key: key);

  @override
  State<RegisterGym> createState() => _RegisterGymState();
}

enum SingingCharacter { man, woman }
enum SingingCharacter2 { open, notopen }

class _RegisterGymState extends State<RegisterGym> {
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
                    SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                    const Text("시설 추가 / 정보 변경", textAlign: TextAlign.right, style: TextStyle(color: Color(0xffe49191), fontSize: 25, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.width * 0.2,
                    MediaQuery.of(context).size.width * 0.05,
                    0.0),
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                          const Text("시설"),
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
                      SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                          const Text("시설주소"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.08),
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
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          const Text("이메일"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.11),
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
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
                      Row(
                        children: <Widget>[
                          //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          const Text("휴대폰 번호"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.045),
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
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.4,),
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "등록 요청하기",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffe49191),
                          ),

                          //border: BorderSide(style: BorderStyle(Color(0xffe49191)))
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
