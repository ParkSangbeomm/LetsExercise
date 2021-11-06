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

            ],
        ),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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
          child: Text(this.title, style: TextStyle(fontSize: 17, color: Colors.white)),

          // child: Text(this.title, style: TextStyle(fontSize: 17,  color: Colors.white)),
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