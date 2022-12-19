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
              providermode.changecurrentlocal("en");
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text('English',style: Theme.of(context)!.textTheme.subtitle1,),
            ),
          ),

          InkWell(
            onTap: (){
              providermode.changecurrentlocal("ar");
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text('العربيه',style: Theme.of(context)!.textTheme.subtitle1,),
            ),
          ),
        ],
      ),
    );
  }
}
