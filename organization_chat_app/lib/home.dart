import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text('Main page',style: TextStyle(color: Color(0xff383434))),
      )
    );
  }
}
