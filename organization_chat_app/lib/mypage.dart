import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [

                  // 동그라미
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffe49191),
                    ),
                    child: Center(
                      child: Text('프로필 정보', ),

                    ),
                  ),
                  // 선
                  Container(
                    margin: EdgeInsets.only(top: 17),
                    height: 2.0,
                    width: swidth*0.6,
                    color: const Color(0xffe49191),
                  )
                ],
              ),

            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}

