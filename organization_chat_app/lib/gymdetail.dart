import 'package:flutter/material.dart';
import 'package:organization_chat_app/googlemap.dart';

class DetailGym extends StatefulWidget {
  final String orgaDes;
  final String orgaName;
  final String address;
  final String img;

  DetailGym({required this.orgaDes, required this.orgaName, required this.address, required this.img});
  @override
  State<DetailGym> createState() => _DetailGym();
}

class _DetailGym extends State<DetailGym> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Image.asset(widget.img,width:MediaQuery.of(context).size.width,),
                Positioned(child: makeText(widget.orgaName, width: 240,  fontSize: 23.0),top: 160,),
                Positioned(child: makeText(widget.address, width: 340,  fontSize: 17.0), top: 190,),
                Positioned(
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xffe49191),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  top: 30,
                  left: 20,
                ),
                Positioned(
                  top: 240,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                          timeColumn('06:00 ~ :23:00','06:00 ~ :23:00', '매주 월요일'),
                          programColumn('PT / 필라테스', 'O.T 2회'),
                          machineColumn('런닝머신 : 13개 / 레플다운 : 4개 / 롱플머신 : 3개 / 플라이 : 3개 / 체스트 프레스 : 4개 / 레그프레스 :4개'),
                          contact(orgaDes),
                          facilities(1,0,1),
                          review('김한동', '너무 좋아요'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    timeColumn('06:00 ~ :23:00','06:00 ~ :23:00', '매주 월요일'),
                    programColumn('PT / 필라테스', 'O.T 2회'),
                    machineColumn('런닝머신 : 13개 / 레플다운 : 4개 / 롱플머신 : 3개 / 플라이 : 3개 / 체스트 프레스 : 4개 / 레그프레스 :4개'),
                    contact('010-1111-2222'),
                    facilities(1,0,1),
                    review('김한동', '너무 좋아요')
                  ],
                ),
              ),
            ),
          ),
          */
        ],
      )
    );
  }

  Widget makeText(String title, {double? width, double? fontSize}) {
    return Container(
      child: Center(child: Text(title, style: TextStyle(fontSize: fontSize, color: Colors.white, fontWeight: FontWeight.bold),),),
      width: width,
    );
  }

  Widget timeColumn(String weekday, String weekend, String holiday) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('운영시간', style:TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('[평일] '+ weekday),
                Text('[주말] '+ weekend),
                Text('[휴관일] '+ holiday),
              ],
            ),
          ),
          Divider(color: Colors.black, thickness: 0.5)
        ],
      ),
    );
  }

  Widget programColumn(String charged, String free) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('프로그램', style:TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('유료'),
                Text(charged),
                Text('무료'),
                Text(free),
              ],
            ),
          ),

          Divider(color: Colors.black, thickness: 0.5)
        ],
      ),
    );
  }

  Widget machineColumn(String machine) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('보유기구', style:TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Text(machine),
              ],
            ),
          ),
          Divider(color: Colors.black, thickness: 0.5)
        ],
      ),
    );
  }

  Widget contact(String phone) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('연락처', style:TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Text(phone),
              ],
            ),
          ),
          Divider(color: Colors.black, thickness: 0.5)
        ],
      ),
    );
  }

  Widget facilities(int a, int b, int c) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('편의시설', style:TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
                children:[
                  a==1 ? Icon(Icons.wifi, size: 50,) : Icon(Icons.perm_scan_wifi_sharp , size: 50, ),
                  b==1 ? Icon(Icons.shower, size: 50,) : Icon(Icons.shower_outlined, size: 50,),
                ]
            ),
          ),


          Divider(color: Colors.black, thickness: 0.5)
        ],
      ),
    );
  }

  Widget review(String name, String content) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('이용후기', style:TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                Icon(Icons.person, size: 50,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(name, style:TextStyle(fontWeight: FontWeight.w600),),
                      Text(content)
                    ]
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
