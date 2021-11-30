import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width * 0.5),
                  Text("운동", style: TextStyle(color: Color(0xffe49191), fontWeight: FontWeight.bold, fontSize: 45, height: 0)),
                  Text("하자", style: TextStyle(color: Color(0xffe49191), fontWeight: FontWeight.bold, fontSize: 45)),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                  ElevatedButton(
                    onPressed:() {
                      Navigator.pop(context);
                    },
                    child: Text("카카오톡으로 로그인", style: TextStyle(fontSize: 13, color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffFBE46C),
                      padding: EdgeInsets.fromLTRB(95, 0, 95, 0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:() {
                      Navigator.pop(context);
                    },
                    child: Text("네이버로 로그인", style: TextStyle(fontSize: 13)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff78B75B),
                      padding: EdgeInsets.fromLTRB(108, 0, 108, 0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:() {
                      Navigator.pop(context);
                    },
                    child: Text("페이스북으로 로그인", style: TextStyle(fontSize: 13)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff4A6ADC),
                      padding: EdgeInsets.fromLTRB(96, 0, 96, 0),
                    ),
                  ),
                  SizedBox(height:20),
                ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
            child: Column(
                children:[
                  Text("최초 로그인 시 이용약관과 개인정보 취급방침,", style: TextStyle(color: Colors.grey)),
                  Text("위치기반서비스 이용약관에 동의하는 것으로 간주합니다", style: TextStyle(color: Colors.grey)),
                ]),
          ),
        ],
      ),
    );
  }
}