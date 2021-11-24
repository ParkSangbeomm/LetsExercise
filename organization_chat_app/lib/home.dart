import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:organization_chat_app/events_example.dart';
import 'package:organization_chat_app/mypage.dart';
import 'package:organization_chat_app/src/table_calendar.dart';
import 'package:organization_chat_app/table_calendar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// import 'package:table_calendar/table_calendar.dart';
import '../utils.dart';
import 'src/table_calendar.dart';
import 'table_calendar.dart';

int _rankIndex = 0;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe49191),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.05,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.015),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,
                          MediaQuery.of(context).size.height * 0.01),
                      child: const Text('Ranking',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 20,
                              fontWeight: FontWeight.bold))),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                              minimumSize: Size(70, 40),
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
                              'Today',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.18,
                              0.0,
                              MediaQuery.of(context).size.width * 0.18,
                              0.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _rankIndex = 1;
                              });
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(70, 40),
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
                              'Week',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _rankIndex = 2;
                              });
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(70, 40),
                              alignment: Alignment.center,
                              shape: _rankIndex == 2
                                  ? StadiumBorder(
                                      side: BorderSide(
                                          color: Colors.white, width: 2),
                                    )
                                  : StadiumBorder(
                                      side: BorderSide(
                                          color: Colors.transparent, width: 2)),
                            ),
                            child: const Text(
                              'Month',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  rankBox(),
                ],
              ),
            ),
            exercise_calendar(),
          ],
        ),
      ),
      // body: Center(
      //   child: Text('Main page',style: TextStyle(color: Color(0xff383434))),
      // )
    );
  }
}

class exercise_calendar extends StatefulWidget {
  const exercise_calendar({
    Key? key,
  }) : super(key: key);

  @override
  State<exercise_calendar> createState() => _exercise_calendarState();
}

class _exercise_calendarState extends State<exercise_calendar> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.03,
                0,
                MediaQuery.of(context).size.width * 0.03,
                0),
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                if (value.length != 0) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          onTap: () => print('${value[index]}'),
                          title: Text('${value[index]}'),
                        ),
                      );
                    },
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 5, // 높이 추가
                      ),
                      Text(
                        "목표 체중까지 -3kg 남았어요! 🔥 ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 3, // 높이 추가
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            Alert(
                                context: context,
                                title: "LOGIN",
                                content: Column(
                                  children: <Widget>[
                                    TextField(
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.account_circle),
                                        labelText: 'Username',
                                      ),
                                    ),
                                    TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.lock),
                                        labelText: 'Password',
                                      ),
                                    ),
                                  ],
                                ),
                                buttons: [
                                  DialogButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ]).show();
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.03,
                                0,
                                MediaQuery.of(context).size.width * 0.03,
                                0),
                            minimumSize: Size(70, 40),
                            alignment: Alignment.center,
                            backgroundColor: Color(0xffe49191),
                            shape: StadiumBorder(
                              side: BorderSide(
                                  color: Color(0xffe49191), width: 2),
                            ),
                          ),
                          child: const Text(
                            '운동 일지 작성',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xfff3f0f0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                ;
              },
            ),
          ),
        ],
      ),
    ));
  }
}

class rankBox extends StatelessWidget {
  const rankBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, MediaQuery.of(context).size.height * 0.01, 0.0, 0.0),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 160,
            alignment: Alignment.topLeft,
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.star,
                    size: 28,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('img/profile.jpeg'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text('로운',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 15)),
                  Text('5시간 / 3일 ',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: 145,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  rank_friend(
                      name: '김해린',
                      times: '5시간',
                      days: '3일',
                      rank: 2.toString()),
                  rank_friend(
                      name: '김영훈',
                      times: '5시간',
                      days: '3일',
                      rank: 3.toString()),
                  rank_friend(
                      name: '박상범',
                      times: '5시간',
                      days: '3일',
                      rank: 4.toString()),
                  rank_friend(
                      name: '강신엽',
                      times: '5시간',
                      days: '3일',
                      rank: 5.toString()),
                  rank_friend(
                      name: '김용현',
                      times: '5시간',
                      days: '3일',
                      rank: 6.toString()),
                  // for (var i = 0; i < hotels.length; i++)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class rank_friend extends StatelessWidget {
  final String name;
  final String times;
  final String days;
  final String rank;
  rank_friend(
      {required this.name,
      required this.times,
      required this.days,
      required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(
          0.0, 0.0, 0.0, MediaQuery.of(context).size.height * 0.01),
      child: Row(children: [
        Text(
          this.rank,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.02, 0.0, 0.0, 0.0),
          width: MediaQuery.of(context).size.width * 0.542,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,

            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('img/profile.jpeg'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0.0,
                    MediaQuery.of(context).size.width * 0.09,
                    0.0),
                child: Text(
                  this.name,
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    this.days + ' / ' + this.times,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              )),
            ],
          ),
        )
      ]),
    );
  }
}
