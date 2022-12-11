import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/layout/setting_tab.dart';

import 'list_tab.dart';

class Home_layout extends StatefulWidget {
  Home_layout();

  static const String routeName = 'Home Layout';

  @override
  State<Home_layout> createState() => _Home_layoutState();
}

class _Home_layoutState extends State<Home_layout> {
  int currentindex = 0;

  List<Widget> tabs = [
    ListTap(),
    SettingTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (index){
          currentindex = index;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_list.png'),
              ),
              label: 'list'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_settings.png'),
              ),
              label: 'settings'),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },

        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Theme.of(context).colorScheme.onPrimary,width: 3,),
        ),
      ),

      body: tabs[currentindex],
    );
  }
}
