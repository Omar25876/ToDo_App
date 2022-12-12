import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/layout/todo_item.dart';
import 'package:todo_app/models/todo_dm.dart';

class ListTap extends StatefulWidget {
  @override
  State<ListTap> createState() => _ListTapState();
}

class _ListTapState extends State<ListTap> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDay,
          firstDate: selectedDay.subtract(Duration(days: 365)),
          lastDate: selectedDay.add(Duration(days: 365)),
          onDateSelected: (date) {
            selectedDay = date;
          },
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.black,
          activeDayColor: Theme.of(context).colorScheme.primary,
          activeBackgroundDayColor: Theme.of(context).colorScheme.onSecondary,
          dotsColor: Theme.of(context).colorScheme.onSecondary,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return TodoItem(
                TodoDM(
                    title: 'play football',
                    description: 'description',
                    time: DateTime.now(),
                    isDone: false),
              );
            },
          ),
        ),
      ],
    );
  }
}
