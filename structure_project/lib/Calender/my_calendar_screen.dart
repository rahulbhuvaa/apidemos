

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:structure_project/utils/app_text_style.dart';
import 'package:structure_project/utils/base_color.dart';

import 'package:table_calendar/table_calendar.dart';

class MyCalendarScreen extends StatefulWidget {
  const MyCalendarScreen({super.key});

  @override
  State<MyCalendarScreen> createState() => _MyCalendarScreenState();
}

class _MyCalendarScreenState extends State<MyCalendarScreen> {
  // final List<NeatCleanCalendarEvent> _eventList = [
  //   NeatCleanCalendarEvent('MultiDay Event A',
  //       description: 'test desc',
  //       startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
  //       endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 12, 0),
  //       color: Colors.orange,
  //       isMultiDay: true),
  //   NeatCleanCalendarEvent('MultiDay Event A',
  //       description: 'test desc',
  //       startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
  //       endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 12, 0),
  //       color: Colors.orange,
  //       isMultiDay: true),
  //   NeatCleanCalendarEvent('MultiDay Event A',
  //       description: 'test desc',
  //       startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
  //       endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 12, 0),
  //       color: Colors.orange,
  //       isMultiDay: true),
  //   NeatCleanCalendarEvent('Allday Event B',
  //       description: 'test desc',
  //       startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2, 14, 30),
  //       endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 17, 0),
  //       color: Colors.pink,
  //       isAllDay: true),
  //   NeatCleanCalendarEvent('Normal Event D',
  //       description: 'test desc',
  //       startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 30),
  //       endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 17, 0),
  //       color: Colors.indigo),
  //   NeatCleanCalendarEvent('Normal Event E',
  //       description: 'test desc',
  //       startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 45),
  //       endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0),
  //       color: Colors.indigo),
  // ];
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focuseDay = DateTime.now();
  DateTime? _selectDate;
  Map<String, List> mySelectedEvents = {};
  @override
  void initState() {
    super.initState();
    loaderPrevieusEvent();
    _selectDate = _focuseDay;
  }

  List listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  loaderPrevieusEvent() {
    mySelectedEvents = {
      "2022-10-01": [
        {"time": "8:00 AM - 9:00 AM", "description": "Workout with Sam"},
        {"time": "8:00 AM - 11:00 AM", "description": "Workout with Sam"}
      ],
      "2022-10-02": [
        {"time": "8:00 AM - 10:00 AM", "description": "test desc"},
        {"time": "8:00 AM - 10:00 AM", "description": "test desc"},
        {"time": "8:00 AM - 10:00 AM", "description": "test desc"},
        {"time": "8:00 AM - 10:00 AM", "description": "test desc"},
        {"time": "8:00 AM - 10:00 AM", "description": "test desc"},
      ],
      "2022-10-05": [
        {"time": "2:00 AM - 5:00 AM", "description": "test desc"},
        {"time": "2:00 AM - 7:00 AM", "description": "test desc"},
        {"time": "2:00 AM - 5:00 AM", "description": "test desc"},
      ],
      "2022-10-08": [
        {"time": "8:00 AM - 9:00 AM", "description": "test desc"},
        {"time": "8:00 AM - 9:00 AM", "description": "test desc"},
      ],
      "2022-10-06": [
        {"time": "8:00 AM - 10:00 AM", "description": "test desc"},
        {"time": "8:00 AM - 3:00 PM", "description": "test desc"},
        {"time": "8:00 AM - 1:00 PM", "description": "test desc"}
      ],
      "2022-10-09": [
        {"time": "8:00 AM - 9:00 AM", "description": "test desc"}
      ],
      "2023-05-08": [
        {"time": "8:00 AM - 9:00 AM", "description": "test desc"}
      ],
      "2023-05-12" : [
         {"time": "8:00 AM - 9:00 AM", "description": "test desc"}
      ]
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TableCalendar(
          daysOfWeekHeight: 20,
          daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: size18(fw: FW.medium), weekendStyle: size18(fw: FW.medium)),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: size24(fw: FW.medium),
            leftChevronIcon: const Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
              size: 30,
            ),
            rightChevronIcon: const Icon(
              Icons.chevron_right_rounded,
              color: Colors.black,
              size: 30,
            ),
            leftChevronPadding: const EdgeInsets.only(left: 40),
            rightChevronPadding: const EdgeInsets.only(right: 40),
          ),
          firstDay: DateTime(2000),
          lastDay: DateTime(2050),
          calendarFormat: _calendarFormat,
          focusedDay: _focuseDay,
          calendarStyle: CalendarStyle(tablePadding: const EdgeInsets.symmetric(vertical: 5),
            outsideDaysVisible: false,
            defaultTextStyle: size18(), 
            todayTextStyle: size18(),
            selectedTextStyle: size18(fontColor: Colors.white),
            weekendTextStyle: size18(),
            todayDecoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            selectedDecoration:
                const BoxDecoration(gradient: LinearGradient(colors: [Color(0xff268AE7), Color(0xffF913DD4)], begin: Alignment.topCenter, end: Alignment.bottomCenter), shape: BoxShape.circle),
          ),
          onDaySelected: (selectDay, focusDay) {
            if (!isSameDay(_selectDate, selectDay)) {
              setState(() {
                _selectDate = selectDay;
                _focuseDay = focusDay;
              });
            }
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectDate, day);
          },
          onFormatChanged: (format) {
            print("====== $format");
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focuseDay) {
            _focuseDay = focuseDay;
          },
          eventLoader: listOfDayEvents,
          calendarBuilders: CalendarBuilders(
            singleMarkerBuilder: (context, date, event) {
              return Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                width: 5.0,
                height: 5.0,
                margin: const EdgeInsets.symmetric(horizontal: 1.5, vertical: 8),
               );
            }, 
            // markerBuilder: (BuildContext context, date, events) {
            //   if (events.isEmpty) return SizedBox();
            //   return ListView.builder(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: events.length,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           margin: const EdgeInsets.only(top: 20),
            //           padding: const EdgeInsets.all(1),
            //           child: Container(
            //             // height: 7, // for vertical axis
            //             width: 5, // for horizontal axis
            //             decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
            //           ),
            //         );
            //       });
            // },
          ),
        ),
     
        // const Divider(color: color023E8A),
        //  sizedBoxHeight(5),

        Expanded(
          // height: 100,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...listOfDayEvents(_selectDate!).map(
                  (myEvent) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                                width: 5,
                                height: 50,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color(0xff268AE7),
                                      Color(0xff913DD4),
                                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(2))),
                           
                            Column( 
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(myEvent["time"].toString(), style: size15(fontColor: greycolorDark)),
                                const Spacer(),
                                Text(myEvent["description"].toString(), style: size20(fw: FW.semiBold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
  
      ]),
    );
  }
}
// body: Calendar(
      //   startOnMonday: true,
      //   weekDays: const ['M', 'T', 'W', 'Th', 'F', 'S', 'S'],
      //   eventsList: _eventList,
      //   eventTileHeight: 70,
      //   isExpandable: true,
      //   eventDoneColor: Colors.green,
      //   selectedColor: Colors.pink,
      //   selectedTodayColor: Colors.red,
      //   todayColor: Colors.blue,
      //   eventColor: null,
      //   locale: 'en_US',
      //   bottomBarColor: whiteColor,
      //   allDayEventText: 'Ganztägig',
      //   multiDayEndText: 'Ende',
      //   isExpanded: true,
      //   expandableDateFormat: 'EEEE, dd. MMMM yyyy',
      //   datePickerType: DatePickerType.date,
      //   dayOfWeekStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
      //   // eventListBuilder: (context, List<NeatCleanCalendarEvent> events) {
      //     //  log("D A T E $events");?"?"
      //   //     return Container(
      //   //         alignment: Alignment.center,
      //   //         height: 50,
      //   //         margin: const EdgeInsets.all(10),
      //   //         child: Row(
      //   //           children: [
      //   //             Container(
      //   //                 width: 5,
      //   //                 height: 50,
      //   //                 decoration: BoxDecoration(
      //   //                     gradient: const LinearGradient(colors: [
      //   //                       Color(0xff268AE7),
      //   //                       Color(0xff913DD4),
      //   //                     ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      //   //                     borderRadius: BorderRadius.circular(2))),
      //   //             sizedBoxWidth(15),
      //   //             Column(
      //   //               crossAxisAlignment: CrossAxisAlignment.start,
      //   //               mainAxisAlignment: MainAxisAlignment.center,
      //   //               children: [
      //   //                 Text(events[0].summary, style: size15(fontColor: greycolorDark)),
      //   //                 const Spacer(),
      //   //                 Text(events[0].description, style: size20(fw: FW.semiBold)),
      //   //               ],
      //   //             ),
      //   //           ],
      //   //         ));
      //   // },
      // ),