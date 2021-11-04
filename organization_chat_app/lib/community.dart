import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.05, MediaQuery.of(context).size.width*0.05, 0.0),
        child: Center(
          child: Text('Community page',style: TextStyle(color: Color(0xff383434))),
        ),
      ),
    );
  }
}
