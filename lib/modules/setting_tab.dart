import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modules/theme_bottomsheet.dart';

import 'language_bottomsheet.dart';

class SettingTap extends StatefulWidget{
  const SettingTap({Key? key}) : super(key: key);

  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 25, 18, 18),
            child: Text("Language",style: Theme.of(context)!.textTheme.headline1,),
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
                  Text('العربية',style: Theme.of(context)!.textTheme.subtitle1),
                  Spacer(),
                  Icon(Icons.arrow_downward,size: 35,),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Text("mode",style: Theme.of(context)!.textTheme.headline1),
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
                  Text("Light",style: Theme.of(context)!.textTheme.subtitle1),
                  Spacer(),
                  Icon(Icons.arrow_downward,size: 35,),
                ],
              ),
            ),
          ),

        ],
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
