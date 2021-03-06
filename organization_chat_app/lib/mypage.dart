import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';


import 'editprofile.dart';
import 'management.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late List<WeightData> _chart1Data;
  late List<MuscleData> _chart2Data;
  late List<FatData> _chart3Data;


  @override
  void initState(){
    _chart1Data = getChart1Data();
    _chart2Data = getChart2Data();
    _chart3Data = getChart3Data();

    super.initState();
  }

  double? maxValue(List<double> arr){
    double max = arr.elementAt(0);

    for(int i=1; i < arr.length; i++){
      if(max < arr.elementAt(i)) {
        max = arr.elementAt(i);
      }
    }
    return max;
  }


  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    double rwidth = swidth*0.9;
    final yearController = TextEditingController();
    final monthController = TextEditingController();
    final dayController = TextEditingController();
    final weightController = TextEditingController();
    final muscleController = TextEditingController();
    final fatController = TextEditingController();
    File? _image;
    String? nickname;
    double? height; double? curWeight; double? goalWeight;
    int? year; int? month; int? day;


    double userBMI = 23.4;
    double startPlace;
    double trianglePlace;

    // 15~37
    if(userBMI <= 18.5){
      startPlace = 0;
      trianglePlace = (userBMI-15)/3.5 * rwidth*0.2;
    }else if(userBMI <= 23){
      startPlace = rwidth*0.2;
      trianglePlace = (userBMI-18.5)/4.5 * rwidth*0.2 - 10;
    }else if(userBMI <= 25){
      startPlace = rwidth*0.4;
      trianglePlace = (userBMI-23)/2 * rwidth*0.2 - 10;
    }else if(userBMI <= 30){
      startPlace = rwidth*0.6;
      trianglePlace = (userBMI-25)/5 * rwidth*0.2 - 10;
    }else{
      startPlace = rwidth*0.8;
      trianglePlace = (userBMI-30)/7 * rwidth*0.2 - 10;
    }

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(swidth*0.05, 0.2, swidth*0.05, 0.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // drawDivider(swidth: swidth, title: "????????? ??????"),
                // const SizedBox(height: 15),
                // ????????? ?????? (??????, ??????, ???, ?????????)
                StreamBuilder<Object>(
                    stream: FirebaseFirestore.instance
                        .collection('UserDemo')
                        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid,)
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      nickname = snapshot.data!.docs[0].get('nickname');
                      height = snapshot.data!.docs[0].get('height');
                      curWeight = snapshot.data!.docs[0].get('curWeight');
                      year = snapshot.data!.docs[0].get('year');
                      month = snapshot.data!.docs[0].get('month');
                      day = snapshot.data!.docs[0].get('day');
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, sheight*0.02, 0, 0.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              drawDivider(swidth: swidth, title: "????????? ??????"),
                              const SizedBox(height: 15),
                              // ????????? ?????? (??????, ??????, ???, ?????????)
                              StreamBuilder<Object>(
                                  stream: FirebaseFirestore.instance
                                      .collection('UserDemo')
                                      .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid,)
                                      .snapshots(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    return Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage: AssetImage('img/jojungsuk.PNG'),
                                        ),
                                        SizedBox(width: 15),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(nickname!, style: TextStyle(fontSize: 20)),
                                              Text(year.toString() + ". " + month.toString() + ". " + day.toString(), style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
                                              Text(height.toString() + "cm, " + curWeight.toString() + "kg", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
                                            ]
                                        )
                                      ],
                                    );
                                  }
                              ),
                              const SizedBox(height: 13),
                              // ?????? 3???
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const EditProfilePage()),
                                        );
                                      },
                                      child: const Text("????????? ??????"),
                                      // borderRadius: BorderRadius.circular(50),
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(115, 36),
                                        primary: const Color(0xffedb9b9),
                                        textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                                      ),                        // textStyle: TextStyle(fontSize: 17, color: Colors.white),
                                    ),
                                    const SizedBox(width:10),

                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const ManagementPage()),
                                        );
                                      },
                                      child: const Text("?????? ??????"),

                                      // borderRadius: BorderRadius.circular(50),
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(108, 36),
                                        primary: const Color(0xffedb9b9),
                                        textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                                      ),                        // textStyle: TextStyle(fontSize: 17, color: Colors.white),

                                    ),
                                    const SizedBox(width:10),
                                    ElevatedButton(
                                      onPressed: () {
                                        Alert(
                                            context: context,
                                            //title: Text("?????? ??????", style: const TextStyle(color: Color(0xffe49191))),
                                            content: Column(
                                              children: <Widget>[
                                                const Text("?????? ??????", style: TextStyle(color: Color(0xffe49191), fontWeight: FontWeight.bold)),
                                                SizedBox(height: 25),
                                                Row(
                                                  children: <Widget>[
                                                    const Text("??????", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                                    SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width * 0.125,
                                                      child: TextField(
                                                        controller: yearController,
                                                        decoration: const InputDecoration(
                                                          contentPadding: EdgeInsets.all(0.0),
                                                          isDense: true,
                                                        ),
                                                      ),
                                                    ),
                                                    const Text(" ???  ", style: TextStyle(fontSize: 14)),
                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width * 0.125,
                                                      child: TextField(
                                                        controller: monthController,
                                                        decoration: const InputDecoration(
                                                          contentPadding: EdgeInsets.all(0.0),
                                                          isDense: true,
                                                        ),
                                                      ),
                                                    ),
                                                    const Text(" ???  ", style: TextStyle(fontSize: 14)),
                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width * 0.125,
                                                      child: TextField(
                                                        controller: dayController,
                                                        decoration: const InputDecoration(
                                                          contentPadding: EdgeInsets.all(0.0),
                                                          isDense: true,
                                                        ),
                                                      ),
                                                    ),
                                                    const Text(" ???", style: TextStyle(fontSize: 14)),
                                                  ],
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                                                Row(
                                                  children: <Widget>[
                                                    //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                                                    const Text("??????", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                                    SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                      child: TextField(
                                                        controller: weightController,
                                                        decoration: const InputDecoration(
                                                          contentPadding: EdgeInsets.all(0.0),
                                                          isDense: true,
                                                        ),
                                                      ),
                                                    ),
                                                    const Text("(kg)", style: TextStyle(fontSize: 14)),
                                                  ],
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                                                Row(
                                                  children: <Widget>[
                                                    //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                                                    const Text("?????????", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                      child: TextField(
                                                        controller: muscleController,
                                                        decoration: const InputDecoration(
                                                          contentPadding: EdgeInsets.all(0.0),
                                                          isDense: true,
                                                        ),
                                                      ),
                                                    ),
                                                    const Text("(kg)", style: TextStyle(fontSize: 14)),
                                                  ],
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                                                Row(
                                                  children: <Widget>[
                                                    //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                                                    const Text("?????????", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                      child: TextField(
                                                        controller: fatController,
                                                        decoration: const InputDecoration(
                                                          contentPadding: EdgeInsets.all(0.0),
                                                          isDense: true,
                                                        ),
                                                      ),
                                                    ),
                                                    const Text("(kg)", style: TextStyle(fontSize: 14)),
                                                  ],
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                              ],
                                            ),
                                            buttons: [
                                              DialogButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: Text(
                                                  "????????????",
                                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                                ),
                                                color: const Color(0xffe49191),
                                                //border: BorderSide(style: BorderStyle(Color(0xffe49191)))
                                              )
                                            ]).show();
                                      },
                                      child: const Text("?????? ??????"),

                                      // borderRadius: BorderRadius.circular(50),
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(108, 36),
                                        primary: const Color(0xffedb9b9),
                                        textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                                      ),                        // textStyle: TextStyle(fontSize: 17, color: Colors.white),

                                    ),
                                  ]),
                            ],
                        ),
                      );
                    }
                ),

                const SizedBox(height: 15),

                // ??????
                // ?????? ?????? ??????
                drawDivider(swidth: swidth, title: "?????? ??????"),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(width: 5),
                    // TODO : ????????? ??????
                    Text("?????????", style: TextStyle(fontSize: 18)),
                    Text(" ?????? ????????? ??????  ", style: TextStyle(fontSize: 18)),
                    // TODO : ????????? ?????? ?????? ??????
                    Text(userBMI.toString(), style: const TextStyle(fontSize: 30))
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                    children: [
                      SizedBox(width: startPlace+trianglePlace),
                      Icon(CupertinoIcons.arrowtriangle_down_fill, color: const Color(0xffe49191), size: 19)
                    ]
                ),
                // ??? ?????????
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text("?????????", style: TextStyle(color: Colors.white)),
                      height: 48,
                      width: rwidth*0.2,
                      color: const Color(0xfff9e9e9),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text("??????", style: TextStyle(color: Colors.white)),
                      height: 48,
                      width: rwidth*0.2,
                      color: const Color(0xfff4d4d4),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text("??????", style: TextStyle(color: Colors.white)),
                      height: 48,
                      width: rwidth*0.2,
                      color: const Color(0xfff1c8c8),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text("????????????", style: TextStyle(color: Colors.white)),
                      height: 48,
                      width: rwidth*0.2,
                      color: const Color(0xffecb2b2),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text("???????????????", style: TextStyle(color: Colors.white)),
                      height: 48,
                      width: rwidth*0.2,
                      color: const Color(0xffe69c9c),
                    ),
                  ],
                ),
                // BMI ?????? ??????
                Container(
                  width: swidth,
                  child: Stack(
                      children: [
                        Text("BMI", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
                        Container(width: rwidth*0.4, child: Center(child: Text("18.5", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))))),
                        Positioned(left: rwidth*0.2, child: Container(width: rwidth*0.4, child: Center(child: Text("23", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c)))))),
                        Positioned(left: rwidth*0.4, child: Container(width: rwidth*0.4, child: Center(child: Text("25", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c)))))),
                        Positioned(left: rwidth*0.6, child: Container(width: rwidth*0.4, child: Center(child: Text("30", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))))))
                      ]
                  ),
                ),
                // ????????? ???????????? ???
                SizedBox(height: 10),
                // ???????????? ???????????? 2
                draw_OutOfHundred(userBMI: userBMI, sex: '???', age: 34, width: rwidth),

                // ?????? ?????? ???
                SizedBox(height:15),
                // ?????? ?????? ??????
                drawDivider(swidth: swidth, title: "?????? ??????"),
                SizedBox(height:10),

                // ?????? ?????????
                Container(
                  // color: const Color(0xff808080),
                    height: 200,
                    child: SfCartesianChart(
                      title: ChartTitle(
                        text: '?????? (kg)',
                        alignment: ChartAlignment.near,
                        // backgroundColor: const Color(0xff808080),
                      ),
                      primaryXAxis: DateTimeCategoryAxis(dateFormat: DateFormat.Md()),
                      series: <ChartSeries>[
                        LineSeries<WeightData, DateTime>(
                            color: const Color(0xffd0d0d0),
                            width: 5,
                            dataSource: _chart1Data,
                            xValueMapper: (WeightData weight, _) => weight.time,
                            yValueMapper: (WeightData weight, _) => weight.weight,
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                            markerSettings: const MarkerSettings(
                              borderColor: Color(0xff00234c),
                              color: Color(0xff00234c),
                              isVisible: true,
                              shape: DataMarkerType.circle,

                            )
                        ),
                      ],
                      // TODO: Axis format ??????
                      primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.none, visibleMaximum: 75),
                    )
                ),

                // ???????????? ?????????
                Container(
                  // color: const Color(0xff808080),
                    height: 200,
                    child: SfCartesianChart(
                      title: ChartTitle(
                        text: '????????? (kg)',
                        alignment: ChartAlignment.near,
                        // backgroundColor: const Color(0xff808080),
                      ),
                      primaryXAxis: DateTimeCategoryAxis(dateFormat: DateFormat.Md()),
                      series: <ChartSeries>[
                        LineSeries<MuscleData, DateTime>(
                            color: const Color(0xffd0d0d0),
                            width: 5,
                            dataSource: _chart2Data,
                            xValueMapper: (MuscleData weight, _) => weight.time,
                            yValueMapper: (MuscleData weight, _) => weight.weight,
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                            markerSettings: const MarkerSettings(
                              borderColor: Color(0xff00234c),
                              color: Color(0xff00234c),
                              isVisible: true,
                              shape: DataMarkerType.circle,

                            )
                        ),
                      ],
                      // TODO: Axis format ??????
                      primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.none, ),
                    )
                ),

                Container(
                  // color: const Color(0xff808080),
                    height: 200,
                    child: SfCartesianChart(
                      title: ChartTitle(
                        text: '???????????? (kg)',
                        alignment: ChartAlignment.near,
                        // backgroundColor: const Color(0xff808080),
                      ),
                      primaryXAxis: DateTimeCategoryAxis(dateFormat: DateFormat.Md()),

                      series: <ChartSeries>[
                        LineSeries<FatData, DateTime>(
                            color: const Color(0xffd0d0d0),
                            width: 5,
                            dataSource: _chart3Data,
                            xValueMapper: (FatData weight, _) => weight.time,
                            yValueMapper: (FatData weight, _) => weight.weight,
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                            markerSettings: const MarkerSettings(
                              borderColor: Color(0xff00234c),
                              color: Color(0xff00234c),
                              isVisible: true,
                              shape: DataMarkerType.circle,

                            )
                        ),
                      ],
                      // TODO: Axis format ??????
                      primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.none),
                    )
                ),
              ],

            )


        ));
  }

  List<WeightData> getChart1Data(){
    final List<WeightData> chart1Data = [
      WeightData(DateTime(2021, 1, 27), 68.7),
      WeightData(DateTime(2021, 2, 26), 68.9),
      WeightData(DateTime(2021, 6, 23), 72.3),
      WeightData(DateTime(2021, 6, 25), 72.4),
      WeightData(DateTime(2021, 6, 27), 72.8),
    ];
    return chart1Data;
  }
  List<MuscleData> getChart2Data(){
    final List<MuscleData> chart2Data = [
      MuscleData(DateTime(2021, 1, 27), 68.7),
      MuscleData(DateTime(2021, 2, 26), 68.9),
      MuscleData(DateTime(2021, 6, 25), 72.4),
      // WeightData(DateTime(2021, 6, 23), 72.3),
      // WeightData(DateTime(2021, 6, 27), 72.8),
    ];
    return chart2Data;
  }
  List<FatData> getChart3Data(){
    final List<FatData> chart3Data = [
      FatData(DateTime(2021, 1, 27), 68.7),
      FatData(DateTime(2021, 2, 26), 68.9),
      FatData(DateTime(2021, 6, 25), 72.4),
      // WeightData(DateTime(2021, 6, 23), 72.3),
      // WeightData(DateTime(2021, 6, 27), 72.8),
    ];
    return chart3Data;
  }
}

class drawDivider extends StatelessWidget {

  final double swidth;
  final String title;

  const drawDivider({Key? key,
    required this.swidth,
    required this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        // ????????????
        Container(
          // margin: EdgeInsets.fromTRB(15, 20, 0, 0),
          height: 35,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffe49191),
          ),
          child: Center(
            child: Text(title, style: const TextStyle(fontSize: 17, color: Colors.white)),
          ),
        ),

        // ???
        Container(
          // margin: EdgeInsets.only(top: 17),
          height: 2.0,
          width: swidth*0.9-110,
          color: const Color(0xffe49191),
        )
      ],

    );
  }
}

class WeightData {
  WeightData(this.time, this.weight);
  final DateTime time;
  final double weight;
}

class MuscleData {
  MuscleData(this.time, this.weight);
  final DateTime time;
  final double weight;
}

class FatData {
  FatData(this.time, this.weight);
  final DateTime time;
  final double weight;
}


class draw_OutOfHundred extends StatefulWidget {

  final double userBMI;
  final String sex;
  final int age;
  final double width;

  const draw_OutOfHundred({Key? key, required this.userBMI, required this.sex, required this.age, required this.width}) : super(key: key);

  @override
  _draw_OutOfHundredState createState() => _draw_OutOfHundredState();
}

class _draw_OutOfHundredState extends State<draw_OutOfHundred> {

  @override
  Widget build(BuildContext context) {
    CollectionReference publicData = FirebaseFirestore.instance.collection('Table_TEST');

    int plusForId;
    String docnum;
    List<String> partText = ["0~25%", "25~50%", "50~75%", "75~100%"];


    // ?????? ??????
    if(widget.sex == "???") {
      plusForId = 0;
    }else{
      // }else if(widget.sex == "???"){
      plusForId = 27;
    }

    if(widget.age<=24){
      docnum = plusForId.toString();
    }else{
      if((widget.age - 24) % 2 == 0){
        docnum = ((((widget.age - 24) /2) + plusForId).toInt()).toString();
      }else{
        docnum = ((((widget.age - 24)/2 + 1) + plusForId).toInt()).toString();
      }
    }


    return FutureBuilder<DocumentSnapshot>(
        future: publicData.doc(docnum).get(),

        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasData == false){
            return const CircularProgressIndicator();
          }
          else if(snapshot.hasError){
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Error: ${snapshot.error}', style: TextStyle(fontSize:15))
            );
          }
          else {
            double standard1 = snapshot.data!.get('25th');
            double standard2 = snapshot.data!.get('50th');
            double standard3 = snapshot.data!.get('75th');
            int emphasis;

            if(widget.userBMI <= standard1){
              emphasis = 0;
            }else if(widget.userBMI <= standard2){
              emphasis = 1;
            }else if(widget.userBMI <= standard3){
              emphasis = 2;
            }else{
              emphasis = 3;
            }
            return Column(

              children: [

                Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // TODO: ?????? ?????????
                      Text("20~24??? ", style: TextStyle(fontSize:15)),
                      Text("?????? ??? ", style: TextStyle(fontSize:15)),
                      Text("?????? ", style: TextStyle(fontSize:15)),
                      Text(partText[emphasis], style: TextStyle(fontSize:25)),
                      Text("??? BMI", style: TextStyle(fontSize:15)),

                    ]
                ),
                SizedBox(height:10),
                Row(
                    children: [
                      SizedBox(width: widget.width*(1/8)*(2*emphasis + 1)-10),
                      Icon(CupertinoIcons.arrowtriangle_down_fill, color: const Color(0xffe49191), size: 19)
                    ]
                ),
                Row(
                  children: [
                    // 0~25
                    Container(
                      alignment: Alignment.center,
                      child: Text("0%~25%", style: TextStyle(color: Colors.white)),
                      height: 48,
                      width: widget.width * 0.25,
                      color: const Color(0xfff9e9e9),
                    ),
                    // 25~50
                    Container(
                      alignment: Alignment.center,
                      child: Text("25%~50%", style: TextStyle(color: Colors.white)),
                      height: 48,
                      width: widget.width * 0.25,
                      color: const Color(0xfff4d4d4),
                    ),
                    // 50~75
                    Container(
                      alignment: Alignment.center,
                      child: Text("50%~75%", style: TextStyle(color: Colors.white)),
                      height: 48,
                      width: widget.width * 0.25,
                      color: const Color(0xfff1c8c8),
                    ),
                    //75~100
                    Container(
                      alignment: Alignment.center,
                      child: const Text("75%~100%", style: TextStyle(color: Colors.white)),
                      height: 48,
                      width: widget.width * 0.25,
                      color: const Color(0xffecb2b2),
                    )
                  ],
                ),
                Container(
                  width: widget.width,
                  child: Stack(
                      children: [
                        // Text(snapshot.data!.get('10th').toString()),
                        const Text("BMI", style: TextStyle(
                            fontSize: 14, color: Color(0xff4c4c4c))),
                        Container(width: widget.width * 0.5,
                            child: Center(child: Text(snapshot.data!.get('25th').toString(), style: const TextStyle(
                                fontSize: 14, color: Color(0xff4c4c4c))))),
                        Positioned(left: widget.width * 0.25,
                            child: Container(width: widget.width * 0.5,
                                child: Center(child: Text(snapshot.data!.get('50th').toString(), style: const TextStyle(
                                    fontSize: 14, color: Color(0xff4c4c4c)))))),
                        Positioned(left: widget.width * 0.5,
                            child: Container(width: widget.width * 0.5,
                                child: Center(child: Text(snapshot.data!.get('75th').toString(), style: const TextStyle(
                                    fontSize: 14, color: Color(0xff4c4c4c)))))),
                      ]
                  ),
                ),
              ],
            );
          }
        }
    );
  }
}