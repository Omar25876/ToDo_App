import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/theme_bottomsheet.dart';

import '../providers/providersetting.dart';
import 'language_bottomsheet.dart';

class SettingTap extends StatefulWidget{
  const SettingTap({Key? key}) : super(key: key);

  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  late SettingProvider providermode;
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    providermode = Provider.of(context);
    return Scaffold(
      appBar:AppBar(
        elevation: 0.0,
        title: Text(
          'settings'.tr(),
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
        ),
        flexibleSpace: SizedBox(height: hight*0.1,),
        toolbarHeight: hight*0.20,
      ),
       body:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 25, 18, 18),
              child: Text("language".tr(),style: TextStyle(
                color: providermode.cuurrenttheme == ThemeMode.light?Colors.black:Colors.white,
                fontSize: 25,
              ),),
            ),
            InkWell(
              onTap: (){

                showlanguagebottomsheet();

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 8),
                margin: EdgeInsets.all(12),
                color: Colors.white,
                child: Row(
                  children: [
                    Text('arabic'.tr(),style: Theme.of(context)!.textTheme.bodyText2),
                    Spacer(),
                    Icon(Icons.arrow_downward,size: 35,),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18),
              child: Text("mode".tr(),style: TextStyle(
                color: providermode.cuurrenttheme == ThemeMode.light?Colors.black:Colors.white,
                fontSize: 25,
              ),),
            ),
            InkWell(
              onTap: (){

                showthemebottomsheet();

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 8),
                margin: EdgeInsets.all(12),
                color: Colors.white,
                child: Row(
                  children: [
                    Text(providermode.cuurrenttheme == ThemeMode.light? "light".tr():"dark".tr(),style: Theme.of(context)!.textTheme.bodyText2),
                    Spacer(),
                    Icon(Icons.arrow_downward,size: 35,),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void showlanguagebottomsheet(){
    showModalBottomSheet(context: context, builder: (context){
      return languagebottomsheet();
    });
  }

  void showthemebottomsheet(){
    showModalBottomSheet(context: context, builder: (context){
      return themebottomsheet();
    });
  }
}
