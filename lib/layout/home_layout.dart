import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/layout/setting_tab.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

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
      backgroundColor: Color.fromRGBO(223, 236, 219, 1.0),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'To Do List',
        ),
        toolbarHeight: MediaQuery.of(context).size.height*.20,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 0.0,
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
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
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {

        },
        child: Icon(Icons.add),
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white,width: 3),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: tabs[currentindex],
    );
  }
}
