import 'package:flutter/material.dart';

class UpdateTextFaild extends StatelessWidget {

TextEditingController controller;
String hint;
TextInputType type;
Function(String) change;
String ? Function(String?) validate;

UpdateTextFaild({required this.controller,
  required this.hint,
  required this.type,
  required this.validate,
  required this.change
});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.subtitle1,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
        ),
        onChanged: change,
        validator: validate,


      ),
    );
  }
}
