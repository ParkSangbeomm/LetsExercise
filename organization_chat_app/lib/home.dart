import 'package:flutter/material.dart';

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
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.05,
            MediaQuery.of(context).size.width * 0.05,
            0.0),
        child: Column(
          children: [
            Container(
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
                  rankBox(),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: Text('Main page',style: TextStyle(color: Color(0xff383434))),
      // )
    );
  }
}

class rankBox extends StatelessWidget {
  const rankBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, MediaQuery.of(context).size.height * 0.01, 0.0, 0.0),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          // color: Colors.orange,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.red,
              ),
            ),
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
                  Text('로운',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 15)),
                  Text('5시간 / 3일 ',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(children: [
                  Text(
                    '2',
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.blueAccent,
                      ),
                    ),
                    child: Row(

                    ),
                  )
                ])
                // for (var i = 0; i < hotels.length; i++)
              ],
            ),
          )
        ],
      ),
    );
  }
}
