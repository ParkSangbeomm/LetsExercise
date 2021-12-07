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
      if(max < arr.elementAt(i))
        max = arr.elementAt(i);
    }
    return max;
  }


  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double rwidth = swidth*0.9;
    double sheight = MediaQuery.of(context).size.height;
    final yearController = TextEditingController();
    final monthController = TextEditingController();
    final dayController = TextEditingController();
    final weightController = TextEditingController();
    final muscleController = TextEditingController();
    final fatController = TextEditingController();
    double userBMI = 27.3;
    double startPlace;
    double trianglePlace;
    int BMIamongHundred=10;


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
              drawDivider(swidth: swidth, title: "프로필 정보"),
              const SizedBox(height: 15),
              // 프로필 정보 (사진, 이름, 키, 몸무게)
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
                        backgroundImage: AssetImage('img/profile.jpeg'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("류준열", style: TextStyle(fontSize: 20)),
                          Text("1990. 10. 10", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
                          Text("183cm, 80kg", style: TextStyle(fontSize: 14, color: Color(0xff4c4c4c))),
                        ]
                      )
                    ],
                  );
                }
              ),
              const SizedBox(height: 13),
              // 버튼 3개
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
                        child: const Text("프로필 수정"),
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
                    child: const Text("친구 관리"),

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
                          //title: Text("기록 추가", style: const TextStyle(color: Color(0xffe49191))),
                          content: Column(
                            children: <Widget>[
                              const Text("기록 추가", style: TextStyle(color: Color(0xffe49191), fontWeight: FontWeight.bold)),
                              SizedBox(height: 25),
                              Row(
                                children: <Widget>[
                                  const Text("날짜", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                                  const Text(" 년  ", style: TextStyle(fontSize: 14)),
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
                                  const Text(" 월  ", style: TextStyle(fontSize: 14)),
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
                                  const Text(" 일", style: TextStyle(fontSize: 14)),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                              Row(
                                children: <Widget>[
                                  //SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                                  const Text("체중", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                                  const Text("골격근", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                                  const Text("체중", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.07),
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
                                "저장하기",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              color: const Color(0xffe49191),
                              //border: BorderSide(style: BorderStyle(Color(0xffe49191)))
                            )
                          ]).show();
                    },
                    child: const Text("기록 추가"),

                    // borderRadius: BorderRadius.circular(50),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(108, 36),
                      primary: const Color(0xffedb9b9),
                      textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                    ),                        // textStyle: TextStyle(fontSize: 17, color: Colors.white),

                  ),
                    ]),
              const SizedBox(height: 15),

              // 신체 상태 시작
              drawDivider(swidth: swidth, title: "신체 상태"),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: 5),
                  // TODO : 닉네임 넣기
                  Text("류준열", style: TextStyle(fontSize: 18)),
                  Text(" 님의 비만도 결과  ", style: TextStyle(fontSize: 18)),
                  // TODO : 비만도 결과 숫자 넣기
                  Text(userBMI.toString(), style: const TextStyle(fontSize: 30))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: startPlace+trianglePlace),
                  Icon(CupertinoIcons.arrowtriangle_down_fill, color: const Color(0xffe49191), size: 19)
                ]
              ),
              // 띠 그래프
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text("저체중", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xfff9e9e9),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("정상", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xfff4d4d4),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("비만", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xfff1c8c8),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("고도비만", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xffecb2b2),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("초고도비만", style: TextStyle(color: Colors.white)),
                    height: 48,
                    width: rwidth*0.2,
                    color: const Color(0xffe69c9c),
                  ),
                ],
              ),
              // BMI 기준 숫자
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
              // 비만도 띠그래프 끝

              // 비만도 막대그래프
              SizedBox(height:10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(width: 3),
                  Text("20~24세 남성 100명 중 ", style: TextStyle(fontSize: 15)),
                  // Text("동일 성별, 동일 연령의 100명 중 ", style: TextStyle(fontSize: 15)),
                  // TODO : 몇번째로 작은 BMI 숫자 넣기
                  Text(BMIamongHundred.toString(), style: const TextStyle(fontSize: 30)),
                  Text(" 번째로 작은 BMI  ", style: TextStyle(fontSize: 15)),
                ],
              ),

              // 신체 상태 끝
              SizedBox(height:15),
              // 신체 변화 시작
              drawDivider(swidth: swidth, title: "신체 변화"),
              SizedBox(height:10),

              // 체중 그래프
              Container(
                  // color: const Color(0xff808080),
                  height: 200,
                  child: SfCartesianChart(
                    title: ChartTitle(
                      text: '체중 (kg)',
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
                    // TODO: Axis format 설정
                    primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.none, visibleMaximum: 75),
                  )
              ),

              // 골격근량 그래프
              Container(
                // color: const Color(0xff808080),
                  height: 200,
                  child: SfCartesianChart(
                    title: ChartTitle(
                      text: '골격근 (kg)',
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
                    // TODO: Axis format 설정
                    primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.none, ),
                  )
              ),

              Container(
                // color: const Color(0xff808080),
                  height: 200,
                  child: SfCartesianChart(
                    title: ChartTitle(
                      text: '체지방량 (kg)',
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
                    // TODO: Axis format 설정
                    primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.none),
                  )
              ),

              // SizedBox(height:10),
              // // 골격근량 그래프
              // Container(
              //   height: 200,
              //   child:
              //       SfCartesianChart(),
              // ),
              // SizedBox(height:10),
              // // 체지방량 그래프
              // Container(
              //     height: 200,
              //     child: SfCartesianChart()
              // )

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

  drawDivider({
    required this.swidth,
    required this.title,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        // 동그라미
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

      // 선
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