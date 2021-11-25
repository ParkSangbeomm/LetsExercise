import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mypage.dart';


class OtherProfilePage extends StatefulWidget {
  const OtherProfilePage({Key? key}) : super(key: key);

  @override
  _OtherProfilePageState createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: ListView(
            children: [Padding(
                padding: EdgeInsets.fromLTRB(swidth*0.05, sheight*0.05, swidth*0.05, 0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      drawDivider(swidth: swidth, title: "프로필 정보"),
                      const SizedBox(height: 15),
                      // 프로필 정보 (사진, 이름, 키, 몸무게)
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('img/profile.jpeg'),
                          ),
                          const SizedBox(width: 15),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("류준열", style: TextStyle(fontSize: 20)),
                                const SizedBox(height: 8),
                                Text("183cm, 80kg", style: TextStyle(fontSize: 14, color: const Color(0xff4c4c4c))),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.65,
                                    child: Row(
                                      children: const [
                                        Spacer(),
                                        Icon(Icons.send),
                                        Text("  쪽지 보내기")
                                      ],
                                    )
                                ),
                              ]
                          )
                        ],
                      ),
                    ]
                )
            ),
              Column(
                  children: [
                    const SizedBox(height: 13),
                    Container(
                      height: 4.0,
                      color: const Color(0xffbfbfbf),
                    )
                  ]
              ),
              const ListTile(
                title: Text("식단인증"),
                subtitle: Text("몸의 비결, 식단!"),
                //Text("kk"),
              ),
            ])
    );
  }
}