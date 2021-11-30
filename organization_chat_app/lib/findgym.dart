
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'locations.dart' as locations;
import 'package:organization_chat_app/googlemap.dart';
import 'package:organization_chat_app/register_gym.dart';

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
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      Text('서울 중구 태평로1가'
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterGym()));
                                },
                                child: Image.asset('img/profile.jpeg',width : MediaQuery.of(context).size.width*0.9,height:MediaQuery.of(context).size.height * 0.2,fit: BoxFit.fitWidth,)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,17,10,17),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text('을지로 피트니스 101'
                                  ,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),),
                                  SizedBox(height:MediaQuery.of(context).size.height*0.005,),
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