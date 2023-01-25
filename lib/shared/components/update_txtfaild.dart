import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providersetting.dart';

class UpdateTextFaild extends StatelessWidget {

TextEditingController controller;
String hint;
String labl;
TextInputType type;
Function(String) change;
String ? Function(String?) validate;

UpdateTextFaild({required this.controller,
  required this.hint,
  required this.type,
  required this.validate,
  required this.change,
  required this.labl,
});
late SettingProvider providermode;
  @override
  Widget build(BuildContext context) {
    providermode = Provider.of(context);
    return Container(
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.subtitle1,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
          labelText: labl,
          labelStyle:TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        onChanged: change,
        validator: validate,


      ),
    );
  }
}
