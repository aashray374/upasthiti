import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40,),
          TableCalendar(focusedDay: DateTime.now(), firstDay: DateTime(DateTime.now().year-4), lastDay: DateTime(DateTime.now().year+4),
          calendarFormat: CalendarFormat.week,),
        ],
      ),
    );
  }
}
