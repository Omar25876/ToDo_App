import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todoprovider.dart';


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

class _AddBottomSheetState extends State<AddBottomSheet> {
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Form(
      key: mykey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              'Add Task',
              style: Theme.of(context).textTheme.subtitle1,
            )),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: Theme.of(context).textTheme.bodyText1,
              ),
              validator: (text){
                if(text == null || text.trim().isEmpty){
                  return 'Please Enter Title';
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
                labelText: 'Description',
                labelStyle: Theme.of(context).textTheme.bodyText1,
              ),
              validator: (text){
                if(text == null || text.trim().isEmpty){
                  return 'Please Enter Description';
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
              'Select Date : ',
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
                'ADD',
                style: Theme.of(context).textTheme.subtitle2,
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
      firstDate: selectedDate,
      lastDate: selectedDate.add(Duration(days: 365)),
    )?? DateTime.now();
  }

  void AddCliked() {
    if(!mykey.currentState!.validate())return;

   var todoscollection =  FirebaseFirestore.instance.collection('todos');
    var emptydoc = todoscollection.doc();

    emptydoc.set({
      'id':emptydoc.id,
      'title':title,
      'description':description,
      'time' : selectedDate.microsecondsSinceEpoch,
      'isDone':false
    }).timeout(Duration(milliseconds: 500),onTimeout: (){
      provider.fetchtodosFromfirestore();
      Navigator.pop(context);
    });
  }
}
