import 'package:flutter/material.dart';

class CommunityPageDetail extends StatefulWidget {
  final String gyms;
  final String title;
  final String description;

  CommunityPageDetail({required this.gyms, required this.title, required this.description,});

  @override
  State<CommunityPageDetail> createState() => _CommunityPageDetailState();
}

class _CommunityPageDetailState extends State<CommunityPageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0 ,horizontal: 15.0),
                    child: Image.asset(widget.gyms, width: MediaQuery
                        .of(context)
                        .size
                        .width-15,),
                  ),
                  Positioned(
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xffe49191),
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    left: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width:  MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.03,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(25, 0, 20, 0),
              child: Text('잡담게시판'
                ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: const Color(0xffE49191),
                ),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
              thickness: 10.0,
              endIndent: 30.0,
            ),
            Container(
              width:  MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.075,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(widget.title
                ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
              thickness: 10.0,
              endIndent: 30.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.15,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(widget.description
                ,style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
              thickness: 10.0,
              endIndent: 30.0,
            ),
            Container(
              width:  MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.015,
              color: const Color(0xffFFF7F0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
              thickness: 10.0,
              endIndent: 30.0,
            ),

          ],
        )
    );
  }

  Widget makeText(String title, {double? width, double? fontSize}) {
    return Container(
      child: Center(child: Text(title, style: TextStyle(fontSize: fontSize,
          color: Colors.white,
          fontWeight: FontWeight.bold),),),
      width: width,
    );
  }
}
