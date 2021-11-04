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
      body: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                    alignment: Alignment.center,
                    child: const Text('Ranking',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
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
                        margin: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
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

                // Opacity(
                //   opacity: 0.6,
                //   child: Container(
                //     margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                //     padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                //     color:  Color(0xffffffff).withOpacity(0.5),
                //     child: Row(
                //       children: [
                //         Text('Today'),
                //         Text('Week'),
                //         Text('Month'),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      // body: Center(
      //   child: Text('Main page',style: TextStyle(color: Color(0xff383434))),
      // )
    );
  }
}
