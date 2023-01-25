import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/providersetting.dart';

class themebottomsheet extends StatelessWidget {
  themebottomsheet({Key? key}) : super(key: key);

  late SettingProvider providermode;

  @override
  Widget build(BuildContext context) {
    providermode = Provider.of(context);
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              providermode.changecurrenttheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text('light'.tr(),style: Theme.of(context)!.textTheme.subtitle1,),
            ),
          ),

          InkWell(
            onTap: (){
              providermode.changecurrenttheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text('dark'.tr(),style: Theme.of(context)!.textTheme.subtitle1,),
            ),
          ),
        ],
      ),
    );
  }
}
