import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text('My page',style: TextStyle(color: Color(0xff383434))),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
