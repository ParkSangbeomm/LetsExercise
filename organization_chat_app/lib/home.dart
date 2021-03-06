import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:organization_chat_app/exercise_calendar.dart';

int _rankIndex = 0;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe49191),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.01,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.015),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,
                          MediaQuery.of(context).size.height * 0.01),
                      child: const Text('Ranking',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 20,
                              fontWeight: FontWeight.bold))),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                              minimumSize: Size(70, 40),
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
                              'Today',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.18,
                              0.0,
                              MediaQuery.of(context).size.width * 0.18,
                              0.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _rankIndex = 1;
                              });
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(70, 40),
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
                              'Week',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _rankIndex = 2;
                              });
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(70, 40),
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
                              'Month',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_rankIndex == 0) rankBox0(),
                  if (_rankIndex == 1) rankBox1(),
                  if (_rankIndex == 2) rankBox2(),
                  // rankNoFriendBox(),
                ],
              ),
            ),
            exercise_calendar(),
          ],
        ),
      ),
    );
  }
}

class rankNoFriendBox extends StatelessWidget {
  const rankNoFriendBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, MediaQuery.of(context).size.height * 0.01, 0.0, 0.0),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 160,
            alignment: Alignment.topLeft,
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.star,
                    size: 28,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('img/profile.jpeg'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text('??????',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 15)),
                  Text('5?????? / 3??? ',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 145,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 1,
            //     color: Colors.orange,
            //   ),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        '???????????? ???????????? ??????????',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffffffff),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          minimumSize: Size(60, 25),
                          alignment: Alignment.center,
                          backgroundColor: Color(0xffffffff).withOpacity(0.5),
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Color(0xffffffff).withOpacity(0.5),
                                width: 0),
                          ),
                        ),
                        child: const Text(
                          '?????? ????????????',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class rankBox0 extends StatelessWidget {
  const rankBox0({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, MediaQuery.of(context).size.height * 0.01, 0.0, 0.0),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 160,
            alignment: Alignment.topLeft,
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.star,
                    size: 28,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('img/default_image.jpg'),
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: AssetImage('img/jojungsuk.PNG'),

                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text('?????????',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 15)),
                  Text('1??? / 3??????',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: 145,
            width: MediaQuery.of(context).size.width * 0.6,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // rank_friend(
                  //     name: '?????????',
                  //     times: '2??????',
                  //     days: '1???',
                  //     rank: 1.toString()),
                  rank_friend(
                      name: '?????????',
                      times: '2??????',
                      days: '1???',
                      rank: 2.toString(),
                      img_url: 'img/shinyeop.jpg'),
                  rank_friend(
                      name: '?????????',
                      times: '1??????',
                      days: '1???',
                      rank: 3.toString(),
                      img_url: 'img/sangbeom.jpg'),
                  rank_friend(
                      name: '?????????',
                      times: '1??????',
                      days: '1???',
                      rank: 4.toString(),
                      img_url: 'img/default_image.jpg'),
                  rank_friend(
                      name: '?????????',
                      times: '0??????',
                      days: '1???',
                      rank: 5.toString(),img_url: 'img/default_image.jpg'),
                  // for (var i = 0; i < hotels.length; i++)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class rankBox1 extends StatelessWidget {
  const rankBox1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, MediaQuery.of(context).size.height * 0.01, 0.0, 0.0),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 160,
            alignment: Alignment.topLeft,
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.star,
                    size: 28,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('img/default_image.jpg'),
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: AssetImage('img/shinyeop.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text('?????????',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 15)),
                  Text('6??? / 10??????',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: 145,
            width: MediaQuery.of(context).size.width * 0.6,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // rank_friend(
                  //     name: '?????????',
                  //     times: '10??????',
                  //     days: '6???',
                  //     rank: 5.toString()),
                  rank_friend(
                      name: '?????????',
                      times: '7??????',
                      days: '5???',
                      rank: 2.toString(),img_url: 'img/jojungsuk.PNG'),
                  rank_friend(
                      name: '?????????',
                      times: '5??????',
                      days: '2???',
                      rank: 3.toString(),img_url: 'img/default_image.jpg'),
                  rank_friend(
                      name: '?????????',
                      times: '4??????',
                      days: '3???',
                      rank: 4.toString(),img_url: 'img/sangbeom.jpg'),
                  rank_friend(
                      name: '?????????',
                      times: '2??????',
                      days: '3???',
                      rank: 5.toString(),img_url: 'img/default_image.jpg'),
                  // for (var i = 0; i < hotels.length; i++)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class rankBox2 extends StatelessWidget {
  const rankBox2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, MediaQuery.of(context).size.height * 0.01, 0.0, 0.0),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 160,
            alignment: Alignment.topLeft,
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.star,
                    size: 28,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: AssetImage('img/shinyeop.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text('?????????',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 15)),
                  Text('25??? / 5??????',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: 145,
            width: MediaQuery.of(context).size.width * 0.6,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  rank_friend(
                      name: '?????????',
                      times: '30??????',
                      days: '20???',
                      rank: 2.toString(),img_url: 'img/jojungsuk.PNG'),
                  rank_friend(
                      name: '?????????',
                      times: '23??????',
                      days: '18???',
                      rank: 3.toString(),img_url: 'img/sangbeom.jpg'),
                  rank_friend(
                      name: '?????????',
                      times: '20??????',
                      days: '14???',
                      rank: 4.toString(),img_url: 'img/default_image.jpg'),
                  rank_friend(
                      name: '?????????',
                      times: '12??????',
                      days: '8???',
                      rank: 5.toString(),img_url: 'img/default_image.jpg'),
                  // for (var i = 0; i < hotels.length; i++)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class rank_friend extends StatelessWidget {
  final String name;
  final String times;
  final String days;
  final String rank;
  final String img_url;
  rank_friend(
      {required this.name,
        required this.times,
        required this.days,
        required this.rank,
        required this.img_url});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(
          0.0, 0.0, 0.0, MediaQuery.of(context).size.height * 0.01),
      child: Row(children: [
        Text(
          this.rank,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.02, 0.0, 0.0, 0.0),
          width: MediaQuery.of(context).size.width * 0.542,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,

            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(this.img_url),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0.0,
                    MediaQuery.of(context).size.width * 0.09,
                    0.0),
                child: Text(
                  this.name,
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        this.days + ' / ' + this.times,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ]),
    );
  }
}