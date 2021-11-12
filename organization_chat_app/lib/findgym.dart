
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'locations.dart' as locations;


class ListGymPage extends StatefulWidget {
  @override
  State<ListGymPage> createState() => _ListGymPageState();
}

class _ListGymPageState extends State<ListGymPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      Icon(Icons.assistant_navigation)
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
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset('img/gym.jpeg',width:MediaQuery.of(context).size.width,),
            Expanded(
                child: Column(
                  children: [

                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}