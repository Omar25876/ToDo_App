import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo_item.dart';
import 'package:todo_app/models/todo_dm.dart';
import 'package:todo_app/providers/todoprovider.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

class ListTap extends StatefulWidget {
  @override
  State<ListTap> createState() => _ListTapState();
}

class _ListTapState extends State<ListTap> {

  late TodoProvider provider ;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    if (provider.todos.isEmpty) provider.fetchtodosFromfirestore();
    return Column(
      children: [
        CalendarTimeline(
          initialDate: provider.selectedDay,
          firstDate: provider.selectedDay.subtract(Duration(days: 365)),
          lastDate: provider.selectedDay.add(Duration(days: 365)),
          onDateSelected: (date) {
            provider.selectedDateupdate(date);
          },
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.black,
          activeDayColor: MyTheme.primaryColor,
          activeBackgroundDayColor: Colors.white,
          dotsColor: Colors.transparent,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(provider.todos[index]);
            },
          ),
        ),
      ],
    );
  }


}
