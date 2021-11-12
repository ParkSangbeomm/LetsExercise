import 'package:flutter/material.dart';
import 'package:organization_chat_app/community.dart';
import 'package:organization_chat_app/findgym.dart';
import 'package:organization_chat_app/home.dart';
import 'package:organization_chat_app/mypage.dart';
import 'package:organization_chat_app/googlemap.dart';

class Navigationbar extends StatefulWidget {
  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int _screenIndex = 0;
  final List<Widget> _screenList = [HomePage(), ListGymPage(),CommunityPage(), MyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_screenIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffe49191),
        unselectedItemColor: const Color(0xff383434),
        currentIndex: _screenIndex,
        onTap: (value) {
          setState(() {
            _screenIndex = value;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: _screenIndex == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: '홈'),
          BottomNavigationBarItem(
              icon: _screenIndex == 1
                  ? const Icon(Icons.add_location_alt)
                  : const Icon(Icons.add_location_alt_outlined),
              label: '운동시설'),
          BottomNavigationBarItem(
              icon: _screenIndex == 2
                  ? const Icon(Icons.people_alt)
                  : const Icon(Icons.people_alt_outlined),
              label: '커뮤니티'),
          BottomNavigationBarItem(
              icon: _screenIndex == 3
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outlined),
              label: 'my page'),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
