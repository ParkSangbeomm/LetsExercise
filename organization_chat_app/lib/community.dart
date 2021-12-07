import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0 ,horizontal: 15.0),
                    child: Image.asset('img/gym.jpeg', width: MediaQuery
                        .of(context)
                        .size
                        .width-15,),
                  ),
                  Positioned(child: makeText(
                      '마초맨 아령들고있는 사', width: 340, fontSize: 17.0),
                    top: 190,),
                ],
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
              child: Text('좋은 날... 좋은 사람들과 함께 운동.. \n너어무 행복'
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
              child: Text('오늘 승언이랑 운동했다.\n등 운동을 빡세게 했다.\n오늘 드디어 레풀다운 80키로를 찍었다.'
                  '\n기념으로 같이 샐러드를 먹었다\n얼른 목표 찍고 치킨 먹고 싶다!!!!\n다음에도 같이 하자 승언아!!!'
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
            Container(
              width:  MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.075,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text('멋집니다 화이팅이에요!'
                ,style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Text('서울 중구 저동1가'
                  ,style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black,
                  ),),
                SizedBox(width:MediaQuery.of(context).size.width*0.6,),
                Text('0.8km'
                  ,style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black,
                  ),)
              ],
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
