import 'package:flutter/material.dart';

class FindgymPage extends StatefulWidget {
  @override
  State<FindgymPage> createState() => _FindgymPageState();
}

class _FindgymPageState extends State<FindgymPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.05, MediaQuery.of(context).size.width*0.05, 0.0),
        child: Center(
          child: Text('Find gym page',style: TextStyle(color: Color(0xff383434))),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
