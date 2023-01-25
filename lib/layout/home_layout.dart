import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/setting_tab.dart';
import 'package:todo_app/providers/providersetting.dart';


import '../modules/add_bottomsheet.dart';
import '../modules/list_tab.dart';

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
late SettingProvider providermode;
  @override
  Widget build(BuildContext context) {
    providermode = Provider.of(context);
    return Scaffold(
      backgroundColor: providermode.cuurrenttheme == ThemeMode.light ?
      Color.fromRGBO(223, 236, 219, 1.0): Color.fromRGBO(6, 14, 30, 1.0),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 3.0,
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          elevation: 5,
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
                label: 'list'.tr()),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_settings.png'),
                ),
                label: 'settings'.tr()),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {

          showbottomesheet();

        },
        child: Icon(Icons.add,color: Colors.white,),
        elevation: 8,
        shape: StadiumBorder(
          side: BorderSide(color: providermode.cuurrenttheme == ThemeMode.light? Colors.white:Colors.black,width: 3),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: tabs[currentindex],
    );
  }

  void showbottomesheet() {
    showModalBottomSheet(context: context, builder: (_){
      return AddBottomSheet();
    });
  }
}
