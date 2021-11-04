import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.05, MediaQuery.of(context).size.width*0.05, 0.0),
        child: Center(
          child: Text('my page',style: TextStyle(color: Color(0xff383434))),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
