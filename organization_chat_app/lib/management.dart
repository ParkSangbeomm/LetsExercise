import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organization_chat_app/editprofile.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({Key? key}) : super(key: key);

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  @override
  //final List<Widget> _screenList = [HomePage(), FindgymPage(),CommunityPage(), MyPage()];
  bool changeColor1 = false;
  bool changeColor2 = true;
  bool changeColor3 = true;

  int _screenIndex = 0;
  final List<Widget> _screenList = [const friendsList(), const requestFriends(),const findFriends()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery
                          .of(context)
                          .size
                          .width * 0.05,
                          0,
                      MediaQuery
                          .of(context)
                          .size
                          .width * 0.05,
                          0.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffe49191),
                          size: 30,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5),
                      const Text("친구관리", textAlign: TextAlign.right,
                          style: TextStyle(color: Color(0xffe49191),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery
                            .of(context)
                            .size
                            .width * 0.05,
                        0,
                        MediaQuery
                            .of(context)
                            .size
                            .width * 0.05,
                        0.0),
                    child: SafeArea(
                        child: Column(
                            children: [
                              SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              setState(() {
                                changeColor1 = false;
                                changeColor2 = true;
                                changeColor3 = true;
                                _screenIndex = 0;
                              }),
                          child: Row(
                            children: [
                              Icon(
                                Icons.people,
                              ),
                              Text("친구 목록", style: TextStyle(
                                  fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.034)),
                            ],
                          ),
                          // borderRadius: BorderRadius.circular(50),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(MediaQuery
                                .of(context)
                                .size
                                .width * 0.27, 36),
                            primary: changeColor1 ? const Color(
                                0xffedb9b9) : const Color(
                                0xffe49191),
                            textStyle: const TextStyle(
                                fontSize: 17,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),

                        ElevatedButton(
                          onPressed: () =>
                              setState(() {
                                changeColor1 = true;
                                changeColor2 = false;
                                changeColor3 = true;
                                _screenIndex = 1;
                              }),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_add,
                              ),
                              Text("친구 요청", style: TextStyle(
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.034)),
                              ],
                            ),
                            // borderRadius: BorderRadius.circular(50),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.27, 20),
                              primary: changeColor2 ? const Color(
                                  0xffedb9b9) : const Color(
                                  0xffe49191),
                              textStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () =>
                                setState(() {
                                  changeColor1 = true;
                                  changeColor2 = true;
                                  changeColor3 = false;
                                  _screenIndex = 2;
                                }),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                ),
                                Text("기록 찾기", style: TextStyle(
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.034)),
                              ],
                            ),

                            // borderRadius: BorderRadius.circular(50),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.27, 36),
                              primary: changeColor3 ? const Color(
                                  0xffedb9b9) : const Color(
                                  0xffe49191),
                              textStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                          ),
                        ]),
                      ]
                    )
                  )
                )
              ],
            ),
            // const friendsList(),
            _screenList[_screenIndex],
            // _screenList[_screenIndex]
            // _screenList[_screenIndex],
          ],
        ),
      ),
    );
  }
}

//친구 목록 메뉴
class friendsList extends StatefulWidget {
  const friendsList({Key? key}) : super(key: key);

  @override
  _friendsListState createState() => _friendsListState();
}

class _friendsListState extends State<friendsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: friends(name: '박상범', icon1: Icons.account_box, icon2: Icons.delete, twoIcons: false),
    );
  }
}

//친구 요청 메뉴
class requestFriends extends StatefulWidget {
  const requestFriends({Key? key}) : super(key: key);

  @override
  _requestFriendsState createState() => _requestFriendsState();
}

class _requestFriendsState extends State<requestFriends> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: friends(name: '박상범', icon1: Icons.check, icon2: Icons.close, twoIcons: true),
    );
  }
}

//친구 찾기 메뉴
class findFriends extends StatefulWidget {
  const findFriends ({Key? key}) : super(key: key);

  @override
  _findFriendsState createState() => _findFriendsState();
}

class _findFriendsState extends State<findFriends> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: friends(name: '박상범', icon1: Icons.account_box, icon2: Icons.person_add_alt_rounded, twoIcons: false),
    );
  }
}

class friends extends StatelessWidget {
  final String name;
  final bool twoIcons;
  final IconData icon1;
  final IconData icon2;
  friends({required this.name, required this.icon1, required this.icon2, required this.twoIcons});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:13),
        Row(
          children: [
            SizedBox(width: 13),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(
                  0.0,
                  0.0,
                  0.0,
                  MediaQuery.of(context).size.height * 0.01),
              child: Row(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      0.0,
                      0.0,
                      0.0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xfffff7f0),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('img/profile.jpeg'),
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
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (twoIcons == true)
                        IconButton(icon: Icon(icon1, color: const Color(
                            0xff78b75b)), onPressed: () {},),
                      if (twoIcons == true)
                        IconButton(icon: Icon(icon2, color: const Color(0xffe49191)), onPressed: () {},)
                      else
                        IconButton(icon: Icon(icon2), onPressed: () {},),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ],
    );
  }
}