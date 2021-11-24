import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'editprofile.dart';
import 'management.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double rwidth = swidth*0.9;
    double sheight = MediaQuery.of(context).size.height;
    double userBMI = 27.3;
    double startPlace;
    double trianglePlace;
    int BMIamongHundred=10;


    // 15~37
    if(userBMI <= 18.5){
      startPlace = 0;
      trianglePlace = (userBMI-15)/3.5 * rwidth*0.2;
    }else if(userBMI <= 23){
      startPlace = rwidth*0.2;
      trianglePlace = (userBMI-18.5)/4.5 * rwidth*0.2 - 10;
    }else if(userBMI <= 25){
      startPlace = rwidth*0.4;
      trianglePlace = (userBMI-23)/2 * rwidth*0.2 - 10;
    }else if(userBMI <= 30){
      startPlace = rwidth*0.6;
      trianglePlace = (userBMI-25)/5 * rwidth*0.2 - 10;
    }else{
      startPlace = rwidth*0.8;
      trianglePlace = (userBMI-30)/7 * rwidth*0.2 - 10;
    }

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
                      Text("1990. 10. 10", style: TextStyle(fontSize: 13, color: Color(0xff4c4c4c))),
                      Text("183cm, 80kg", style: TextStyle(fontSize: 13, color: Color(0xff4c4c4c))),
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
              const SizedBox(height: 15),

              // 신체 상태 시작
              drawDivider(swidth: swidth, title: "신체 상태"),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: 5),
                  // TODO : 닉네임 넣기
                  Text("류준열", style: TextStyle(fontSize: 18)),
                  Text(" 님의 비만도 결과  ", style: TextStyle(fontSize: 18)),
                  // TODO : 비만도 결과 숫자 넣기
                  Text(userBMI.toString(), style: const TextStyle(fontSize: 30))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: startPlace+trianglePlace),
                  Icon(CupertinoIcons.arrowtriangle_down_fill, color: const Color(0xffe49191), size: 19)
                ]
              ),
              // 띠 그래프
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text("저체중", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xfff9e9e9),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("정상", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xfff4d4d4),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("비만", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xfff1c8c8),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("고도비만", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xffecb2b2),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("초고도비만", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xffe69c9c),
                  ),
                ],
              ),
              // BMI 기준 숫자
              Container(
                width: swidth,
                child: Stack(
                  children: [
                    Text("BMI", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
                    Container(width: rwidth*0.4, child: Center(child: Text("18.5", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))))),
                    Positioned(left: rwidth*0.2, child: Container(width: rwidth*0.4, child: Center(child: Text("23", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c)))))),
                    Positioned(left: rwidth*0.4, child: Container(width: rwidth*0.4, child: Center(child: Text("25", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c)))))),
                    Positioned(left: rwidth*0.6, child: Container(width: rwidth*0.4, child: Center(child: Text("30", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))))))
                  ]
                ),
              ),
              // 비만도 띠그래프 끝

              // 비만도 막대그래프
              SizedBox(height:10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(width: 3),
                  Text("20~24세 남성 100명 중 ", style: TextStyle(fontSize: 15)),
                  // Text("동일 성별, 동일 연령의 100명 중 ", style: TextStyle(fontSize: 15)),
                  // TODO : 몇번째로 작은 BMI 숫자 넣기
                  Text(BMIamongHundred.toString(), style: const TextStyle(fontSize: 30)),
                  Text(" 번째로 작은 BMI  ", style: TextStyle(fontSize: 15)),
                ],
              ),

              // 신체 상태 끝
              SizedBox(height:15),
              // 신체 변화 시작
              drawDivider(swidth: swidth, title: "신체 변화"),

            ],

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