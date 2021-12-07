import 'package:flutter/material.dart';
import 'package:organization_chat_app/writing.dart';

import 'community_detail.dart';

int _rankIndex = 0;

class CommunityPage extends StatefulWidget {
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.03, MediaQuery.of(context).size.height*0.03, MediaQuery.of(context).size.width*0.03, 0.0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _rankIndex = 0;
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        shape: _rankIndex == 0
                            ? StadiumBorder(
                          side: BorderSide(
                              color: Colors.white, width: 2),
                        )
                            : StadiumBorder(
                            side: BorderSide(
                                color: Colors.transparent, width: 2)),
                      ),
                      child: const Text(
                        '자유게시판',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.09,
                        0.0,
                        0,
                        0.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _rankIndex = 1;
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        shape: _rankIndex == 1
                            ? StadiumBorder(
                          side: BorderSide(
                              color: Colors.white, width: 2),
                        )
                            : StadiumBorder(
                            side: BorderSide(
                                color: Colors.transparent, width: 2)),
                      ),
                      child: const Text(
                        '루틴자랑',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.09,
                        0.0,
                        0,
                        0.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _rankIndex = 2;
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        shape: _rankIndex == 2
                            ? StadiumBorder(
                          side: BorderSide(
                              color: Colors.white, width: 2),
                        )
                            : StadiumBorder(
                            side: BorderSide(
                                color: Colors.transparent, width: 2)),
                      ),
                      child: const Text(
                        '식단인증',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.09,
                        0.0,
                        0,
                        0.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _rankIndex = 2;
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        shape: _rankIndex == 2
                            ? StadiumBorder(
                          side: BorderSide(
                              color: Colors.white, width: 2),
                        )
                            : StadiumBorder(
                            side: BorderSide(
                                color: Colors.transparent, width: 2)),
                      ),
                      child: const Text(
                        '내 게시글',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black, thickness: 0.5),
            SizedBox(
              child :Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10.0,0),
                    child: ElevatedButton(

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Writing()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "글 작성하기",
                              style: TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                itemCount: 6,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, int index) {
                  return Card(
                    shadowColor: Colors.black,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage('img/profile.jpeg'),
                                ),
                              ),
                              Text("류준열"),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.15,),
                              SizedBox(
                                width: 94,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: (){},
                                    child: Row(
                                      children: [
                                        Icon(Icons.thumb_up_outlined, size: 10,),
                                        Text(
                                          " 좋아요 100",
                                          style: TextStyle(color: Colors.white, fontSize: 10),
                                        ),

                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xffe49191),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                    )
                                ),
                              ),
                              SizedBox(width: 20,),
                              SizedBox(
                                width: 80,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: (){},
                                    child: Row(
                                      children: [
                                        Icon(Icons.chat_bubble_outline, size: 10,),
                                        Text(
                                          " 댓글 30",
                                          style: TextStyle(color: Colors.white, fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xffe49191),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityPageDetail()));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Image.asset('img/profile.jpeg',width : MediaQuery.of(context).size.width*0.2,height:MediaQuery.of(context).size.height * 0.2,fit: BoxFit.fitWidth,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Image.asset('img/profile.jpeg',width : MediaQuery.of(context).size.width*0.2,height:MediaQuery.of(context).size.height * 0.2,fit: BoxFit.fitWidth,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Image.asset('img/profile.jpeg',width : MediaQuery.of(context).size.width*0.2,height:MediaQuery.of(context).size.height * 0.2,fit: BoxFit.fitWidth,),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              alignment : Alignment.centerLeft,
                              child: Text("This is explanation")),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}