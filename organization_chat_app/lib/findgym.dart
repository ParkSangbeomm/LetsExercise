
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'locations.dart' as locations;
import 'package:organization_chat_app/googlemap.dart';

import 'googlemap.dart';


class ListGymPage extends StatefulWidget {
  @override
  State<ListGymPage> createState() => _ListGymPageState();
}

class _ListGymPageState extends State<ListGymPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Container(
                  width:  MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: const Color(0xffe49191),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      Text('서울시 중구 태평'),
                      Text('위치변경'),
                      IconButton(
                        icon: Icon(Icons.assistant_navigation),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FindgymPage()));
                        },
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
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailGym()));
                                },
                                child: Image.asset('img/profile.jpeg',width : MediaQuery.of(context).size.width*0.9,height:MediaQuery.of(context).size.height * 0.2,fit: BoxFit.fitWidth,)),
                            Column(
                              children: [
                              Text('을지로 피트니스 101'),
                              Row(
                                children: [
                                  Text('서울 중구 저동1가'),
                                  Text('0.8km')
                                ],
                              ),
                              ]
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //resizeToAvoidBottomInset: false,
    );
  }
}

class DetailGym extends StatefulWidget {
  @override
  State<DetailGym> createState() => _DetailGym();
}

class _DetailGym extends State<DetailGym> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Image.asset('img/gym.jpeg',width:MediaQuery.of(context).size.width,),
            Column(
              children: [
                timeColumn(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container timeColumn() {
    return Container(
      child: Column(
                        children: [
                          Text('운영시간'),
                          Text('[평일] 06:00 ~ :23:00'),
                          Text('[주말] 06:00 ~ :23:00'),
                          Text('[공휴일] 06:00 ~ :23:00'),
                          Text('[휴관일] 06:00 ~ :23:00'),
                          Divider(color: Colors.black, thickness : 1.0)
                        ],
                      ),
    );
  }

  Container programColumn() {
    return Container(
      child: Column(
        children: [
          Text('운영시간'),
          Text('[평일] 06:00 ~ :23:00'),
          Text('[주말] 06:00 ~ :23:00'),
          Text('[공휴일] 06:00 ~ :23:00'),
          Text('[휴관일] 06:00 ~ :23:00'),
          Divider(color: Colors.black, thickness : 1.0)
        ],
      ),
    );
  }

  Container machineColumn() {
    return Container(
      child: Column(
        children: [
          Text('운영시간'),
          Text('[평일] 06:00 ~ :23:00'),
          Text('[주말] 06:00 ~ :23:00'),
          Text('[공휴일] 06:00 ~ :23:00'),
          Text('[휴관일] 06:00 ~ :23:00'),
          Divider(color: Colors.black, thickness : 1.0)
        ],
      ),
    );
  }

  Container contact() {
    return Container(
      child: Column(
        children: [
          Text('운영시간'),
          Text('[평일] 06:00 ~ :23:00'),
          Text('[주말] 06:00 ~ :23:00'),
          Text('[공휴일] 06:00 ~ :23:00'),
          Text('[휴관일] 06:00 ~ :23:00'),
          Divider(color: Colors.black, thickness : 1.0)
        ],
      ),
    );
  }

  Container facilities() {
    return Container(
      child: Column(
        children: [
          Text('운영시간'),
          Text('[평일] 06:00 ~ :23:00'),
          Text('[주말] 06:00 ~ :23:00'),
          Text('[공휴일] 06:00 ~ :23:00'),
          Text('[휴관일] 06:00 ~ :23:00'),
          Divider(color: Colors.black, thickness : 1.0)
        ],
      ),
    );
  }

  Container location() {
    return Container(
      child: Column(
        children: [
          Text('운영시간'),
          Text('[평일] 06:00 ~ :23:00'),
          Text('[주말] 06:00 ~ :23:00'),
          Text('[공휴일] 06:00 ~ :23:00'),
          Text('[휴관일] 06:00 ~ :23:00'),
          Divider(color: Colors.black, thickness : 1.0)
        ],
      ),
    );
  }
}
