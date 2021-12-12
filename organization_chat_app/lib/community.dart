import 'package:flutter/material.dart';
import 'package:organization_chat_app/writing.dart';

import 'community_detail.dart';

int _rankIndex = 0;
List gyms = ['img/pants.jpeg','img/friend.jpeg','img/back.png','img/back23.jpeg','img/gym.jpeg','img/medi.jpeg','img/gym.jpeg'];

List title = ['최고의 성장은 근성장','좋은 날… 좋은 사람들과 운동…','내가… 등을… 했던가?','동기사랑 나라사랑 근육사랑',"내가 누구? ‘헬스장 1년개근’",'새로운 기구는 못참지'];
List description = [
  '오늘 바디 체크를 했다!!!! 작았던 바지가 들어가는 순간 목표 달성을 예상했지만, 몸무게 앞자리까지 내려갈 줄 몰랐다',
  '오늘 승언이랑 운동했다 등 운동을 빡세게 했다 오늘 드디어 레플다운 80키로를 찍었다',
  '오늘 등 운동을 다시했다 오늘 등 하는 날이 아닌데도 등을 했다 나… 생각보다 등신일지도',
  '오늘 같은 헬스장에 전역한 동기가 다닌다는 걸 알게됐다 간만에 같이 운동하니까 예전 생각도 나고 좋았다!',
  '오늘 관장님이 1년동안 하루도 안빠지고 나온 사람이 나밖에 없다고 하셨다!!! 여자친구 없냐고 물어봐서 좀 슬펐다 그래도 좋아!',
  '오늘 헬스장에 가니 새로운 기구가 들어와있었다! 항상 유튜브에서만 보던 기구가 들어와서 신났다 내일 바로 타봐야겠다',
];
List sdesc = [
  '오늘 바디 체크를 했다!!!! 작았던 바지가..',
  '오늘 승언이랑 운동했다 등 운동을 빡세..',
  '오늘 등 운동을 다시했다 오늘 등 하는..',
  '오늘 같은 헬스장에 전역한 동기가...',
  '오늘 관장님이 1년동안 하루도 안빠지고..',
  '오늘 헬스장에 가니 새로운 기구가 들..'
];

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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.48,
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

            if(_rankIndex==0)
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
                                    child: Row(
                                      children: [
                                        Text('자유게시판'),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.5,
                                        ),
                                        Text('Detail >', style: TextStyle(fontSize: 10),)
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityPageDetail(gyms: gyms[index], title: title[index], description: description[index],)));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text(title[index], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),overflow: TextOverflow.ellipsis,),
                                          SizedBox(height: 10,),
                                          Text(sdesc[index], style: TextStyle(color: Colors.grey),overflow: TextOverflow.ellipsis,)
                                        ]
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Image.asset(gyms[index],width : MediaQuery.of(context).size.width*0.2,height:MediaQuery.of(context).size.height * 0.2,fit: BoxFit.fitWidth,),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
            if(_rankIndex==2)
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  itemCount: 2,
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
                                    child: Row(
                                      children: [
                                        Text('자유게시판'),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.5,
                                        ),
                                        Text('Detail >', style: TextStyle(fontSize: 10),)
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityPageDetail(gyms: gyms[index], title: title[index], description: description[index],)));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text(title[index], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),overflow: TextOverflow.ellipsis,),
                                          SizedBox(height: 10,),
                                          Text(sdesc[index], style: TextStyle(color: Colors.grey),overflow: TextOverflow.ellipsis,)
                                        ]
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Image.asset(gyms[index],width : MediaQuery.of(context).size.width*0.2,height:MediaQuery.of(context).size.height * 0.2,fit: BoxFit.fitWidth,),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Writing()));
        },
        backgroundColor: Color(0xffe49191),
        child: const Icon(Icons.add),
      ),
    );
  }
}