import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(swidth*0.05, sheight*0.05, swidth*0.05, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              drawDivider(swidth: swidth, title: "프로필 정보"),
              const SizedBox(height: 15),
              // 프로필 정보 (사진, 이름, 키, 몸무게)
              Row(
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
              const SizedBox(height: 13),
              // 버튼 3개
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    ElevatedButton(
                      onPressed: () {

                      },
                        child: const Text("프로필 수정"),

                        // borderRadius: BorderRadius.circular(50),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(113, 36),
                          primary: const Color(0xffedb9b9),
                          textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                        ),                        // textStyle: TextStyle(fontSize: 17, color: Colors.white),

                    ),
                  const SizedBox(width:10),

                  ElevatedButton(
                    onPressed: () {

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