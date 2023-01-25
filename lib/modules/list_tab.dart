import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo_item.dart';
import 'package:todo_app/models/todo_dm.dart';
import 'package:todo_app/providers/todoprovider.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

import '../providers/providersetting.dart';

class ListTap extends StatefulWidget {
  @override
  State<ListTap> createState() => _ListTapState();
}

class _ListTapState extends State<ListTap> {

  late TodoProvider provider ;
  late SettingProvider providermode ;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    providermode = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'todolists'.tr(),
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height*.20,
      ),
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: provider.selectedDay,
            firstDate: provider.selectedDay.subtract(Duration(days: 365)),
            lastDate: provider.selectedDay.add(Duration(days: 365)),
            onDateSelected: (date) {
              provider.selectedDateupdate(date);
            },
            leftMargin: 20,
            monthColor: providermode.cuurrenttheme == ThemeMode.light ? Colors.black:Colors.white,
            dayColor: providermode.cuurrenttheme == ThemeMode.light ? Colors.black:Colors.white,
            activeDayColor: providermode.cuurrenttheme == ThemeMode.light ? MyTheme.primaryColor:Colors.white,
            activeBackgroundDayColor: providermode.cuurrenttheme == ThemeMode.light ?Colors.white:MyTheme.primaryColor,
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
      ),
    );
  }


}
