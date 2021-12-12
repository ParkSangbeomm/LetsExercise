import 'package:flutter/material.dart';
import 'package:organization_chat_app/navigationbar.dart';
import 'package:organization_chat_app/home.dart';
import 'package:organization_chat_app/findgym.dart';
import 'package:organization_chat_app/community.dart';
import 'package:organization_chat_app/mypage.dart';

import 'login.dart';


class ExerciseApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'team25',
      home: Navigationbar(),
      initialRoute: '/login',
      // onGenerateRoute: _getRoute,
      routes: {
        '/login' : (context) => LoginPage(),
        '/bar' : (context) => Navigationbar(),
        '/home' : (context) => HomePage(),
        '/findgym' : (context) => ListGymPage(),
        '/community' : (context) => CommunityPage(),
        '/myPage' : (context) => MyPage(),
      },
    );
  }

  // Route<dynamic> _getRoute(RouteSettings settings) {
  //   if (settings.name != '/login') {
  //     return null;
  //   }
  //
  //   return MaterialPageRoute<void>(
  //     settings: settings,
  //     builder: (BuildContext context) => LoginPage(),
  //     fullscreenDialog: true,
  //   );
  // }
}
