import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text('Community page',style: TextStyle(color: Color(0xff383434))),
      ),
    );
  }
}
