import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'locations.dart' as locations;
import 'package:organization_chat_app/googlemap.dart';
import 'package:organization_chat_app/gymdetail.dart';
List orgades = [
  '02-999-2229',
  '',
  '02-94500740',
  '02-985-7797',
  '02-6080-3451',
  '02-908-2221'

];
List name = ['가인', '현대 휘트니스', '소울 휘트니스', 'Well-Being', 'Double 휘트니스 클럽', '노블휘트니스클럽',
          '범 휘트니스', 'FUN 휘트니스'];
List address = ['서울특별시 강북구 수유동 381-2', '서울특별시 강북구 미아동 703-31', '서울특별시 강북구 미아동 7-5 대지빌딩 4층', '서울특별시 강북구 월계로7나길 4 (미아동)', '서울특별시 강북구 인수봉로 293  (수유동)', '서울특별시 강북구 한천로 1093 (수유동, 하나은행)',
                '서울특별시 강북구 삼양로 293 (수유동)', '서울특별시 강북구 솔샘로 327 (미아동,2층)'];
List gyms = ['img/fristgym.jpeg','img/fourthgym.jpeg','img/thirdgym.jpeg','img/secondgym.jpeg','img/gym.jpeg','img/thirdgym.jpeg','img/fourthgym.jpeg'];
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
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      Text('서울특별시 강북구'
                        ,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      Text('위치변경'
                        ,style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.grey,
                        ),),
                      Row(
                        children: [
                          SizedBox(width:MediaQuery.of(context).size.width*0.8,),
                          IconButton(
                            icon: Icon(Icons.assistant_navigation),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FindgymPage()));
                            },
                          ),
                        ],
                      ),
                    ],

                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    itemCount: 7,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, int index) {
                      return Card(
                        shadowColor: Colors.black,
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailGym(orgaDes : orgades[index], orgaName : name[index], address : address[index], img : gyms[index])));
                                },
                                child: Image.asset(gyms[index],width : MediaQuery.of(context).size.width*0.9,height:MediaQuery.of(context).size.height * 0.2,fit: BoxFit.fitWidth,)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,17,10,17),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(name[index]
                                      ,style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),),
                                    SizedBox(height:MediaQuery.of(context).size.height*0.005,),
                                    Row(
                                      children: [
                                        Text(address[index]
                                          ,style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.black,
                                          ),),

                                      ],
                                    ),
                                  ]
                              ),
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