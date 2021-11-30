
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterGym()));
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