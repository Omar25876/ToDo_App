import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providersetting.dart';

class languagebottomsheet extends StatelessWidget {
  languagebottomsheet({Key? key}) : super(key: key);

  late SettingProvider providermode;


  @override
  Widget build(BuildContext context) {
    providermode = Provider.of(context);
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              context.setLocale(Locale("en"));
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text('english'.tr(),style: Theme.of(context)!.textTheme.subtitle1,),
            ),
          ),

          InkWell(
            onTap: (){
              context.setLocale(Locale("ar","EG"));
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text('arabic'.tr(),style: Theme.of(context)!.textTheme.subtitle1,),
            ),
          ),
        ],
      ),
    );
  }
}
