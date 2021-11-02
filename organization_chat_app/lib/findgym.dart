import 'package:flutter/material.dart';

class FindgymPage extends StatefulWidget {
  @override
  State<FindgymPage> createState() => _FindgymPageState();
}

class _FindgymPageState extends State<FindgymPage> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text('Find gym page',style: TextStyle(color: Color(0xff383434))),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
