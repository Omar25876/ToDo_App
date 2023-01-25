import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todoprovider.dart';

import '../providers/providersetting.dart';


class AddBottomSheet extends StatefulWidget {
  AddBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}
GlobalKey<FormState> mykey = GlobalKey<FormState>();
DateTime selectedDate = DateTime.now();

String? title;
String? description;
late TodoProvider provider;
late SettingProvider providermode;

class _AddBottomSheetState extends State<AddBottomSheet> {
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    providermode = Provider.of(context);

    return Form(
      key: mykey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              'addtask'.tr(),
              style: Theme.of(context).textTheme.subtitle1,
            )),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'title'.tr(),
                labelStyle: Theme.of(context).textTheme.bodyText1,
              ),
              validator: (text){
                if(text == null || text.trim().isEmpty){
                  return 'asktitle'.tr();
                }
              },
              onChanged: (text){
                title = text;
              },
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'description'.tr(),
                labelStyle: Theme.of(context).textTheme.bodyText1,
              ),
              validator: (text){
                if(text == null || text.trim().isEmpty){
                  return 'askdesc'.tr();
                }
              },
              onChanged: (text){
                description = text;
              },
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'selectdate'.tr(),
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.start,
            ),
            InkWell(
                onTap: () {
                  showmydatepicker();
                },
                child: Center(
                    child: Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: Theme.of(context).textTheme.bodyText1,
                ))),
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(8))),
              onPressed: () {
                mykey.currentState!.validate();
                AddCliked();
              },
              child: Text(
                'add'.tr(),
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showmydatepicker() async{
    selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: selectedDate.add(Duration(days: 365)),
    )?? DateTime.now();
  }

  void AddCliked() {
    if(!mykey.currentState!.validate())return;
   var todoscollection =  FirebaseFirestore.instance.collection('todos');

    todoscollection.doc().set({
      'title':title,
      'description':description,
      'time' : selectedDate.millisecondsSinceEpoch,
      'isDone':false
    }).timeout(Duration(milliseconds: 500),onTimeout: (){
      provider.fetchtodosFromfirestore();
      Navigator.pop(context);

    });
  }
}
