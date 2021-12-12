import 'dart:io';

import 'package:flutter/material.dart';
import 'package:organization_chat_app/exercise_memo.dart';
import 'package:organization_chat_app/src/table_calendar.dart';
import 'package:organization_chat_app/table_calendar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:image_picker/image_picker.dart';
import '../utils.dart';
import 'src/table_calendar.dart';
import 'table_calendar.dart';

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
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  final TextEditingController _memocontroller = TextEditingController();
  File? _imageFile;
  File? _savedFile;
  String? _selectedFromTime = '시작 시간';
  String? _selectedToTime = '종료 시간';

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
        _selectedFromTime = '시작 시간';
        _selectedToTime = '종료 시간';
        _memocontroller.clear();
        _imageFile = null;
        _savedFile = null;
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  // void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
  //   setState(() {
  //     _selectedDay = null;
  //     _focusedDay = focusedDay;
  //     _rangeStart = start;
  //     _rangeEnd = end;
  //     _rangeSelectionMode = RangeSelectionMode.toggledOn;
  //   });
  //
  //   // `start` or `end` could be null
  //   if (start != null && end != null) {
  //     _selectedEvents.value = _getEventsForRange(start, end);
  //   } else if (start != null) {
  //     _selectedEvents.value = _getEventsForDay(start);
  //   } else if (end != null) {
  //     _selectedEvents.value = _getEventsForDay(end);
  //   }
  // }

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
                // onRangeSelected: _onRangeSelected,
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
                              color: Color(0xfffff7f0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '2시간  (20:00 - 22:00)',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff363535),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '등운동 : 바벨 로우, 친 업  10회 3 세트 복근운동 : AB슬라이드, 크런치, 레그레이즈 15회 3세트 ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff939393),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 0.0, 0.0),
                                      width: 100,
                                      child: InkWell(
                                        child: Image.asset('img/testRecord.jpeg'),
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          );
                        },
                      );
                    } else {
                      return SingleChildScrollView( child: Column(
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ExerciseMemo()),
                                );
                              },
                              // onPressed: () => _showAlert(context),

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
                      ));
                    }
                    ;
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Future getImage() async {
    print('getImage f.');
    var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
      // _isPicked = true;
    });
  }

  _showAlert(context) {
    Alert(
        context: context,
        closeIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            setState(() {
              _imageFile = _savedFile;
              _selectedFromTime = '시작 시간';
              _selectedToTime = '종료 시간';
              _memocontroller.clear();
            });
            Navigator.pop(context);
          },
        ),
        content: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Text(
                    "오늘의",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffe49191),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Text(
                    "운동",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffe49191),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 100,
              child: InkWell(
                onTap: () => getImage(),
                child: _imageFile == null
                    ? Image.asset('img/imageRegister.png')
                    : Image.file(File(_imageFile!.path)),
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '운동 시간',
                style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      child: Text(
                        _selectedFromTime!,
                        style: TextStyle(color: Color(0xff242424)),
                      ),
                      onPressed: () {
                        Future<TimeOfDay?> selectedTime = showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        selectedTime.then((TimeofDay) {
                          setState(() {
                            _selectedFromTime =
                            '${TimeofDay?.hour}:${TimeofDay?.minute}';
                          });
                        });
                      }),
                  Text(
                    '  -  ',
                    style: TextStyle(color: Color(0xff242424)),
                  ),
                  TextButton(
                      child: Text(
                        _selectedToTime!,
                        style: TextStyle(color: Color(0xff242424)),
                      ),
                      onPressed: () {
                        Future<TimeOfDay?> selectedTime = showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        selectedTime.then((TimeofDay) {
                          setState(() {
                            _selectedToTime =
                            '${TimeofDay?.hour}:${TimeofDay?.minute}';
                          });
                        });
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '운동 메모',
                style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              height: 5 * 24.0,
              child: TextField(
                maxLines: 5,
                controller: _memocontroller,
                cursorColor: Color(0xffe49191),
                decoration: InputDecoration(
                  hintText: '운동 기록을 메모해주세요.',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff8b8a8a),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff8b8a8a),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              setState(() {
                _savedFile = _imageFile;
              });
              Navigator.pop(context);
            },
            color: Color(0xffe49191),
            child: Text(
              "기록하기",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]).show();
  }
}