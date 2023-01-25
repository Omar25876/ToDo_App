import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/update_item.dart';
import 'package:todo_app/shared/styles/my_theme.dart';
import '../models/todo_dm.dart';
import '../providers/providersetting.dart';
import '../providers/todoprovider.dart';

class TodoItem extends StatefulWidget {
  TodoDM todo;

  TodoItem(this.todo);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
late TodoProvider provider ;
late SettingProvider providermode ;

  @override
  Widget build(BuildContext context) {
    provider =  Provider.of(context);
    providermode =  Provider.of(context);
    return Slidable(
      startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [

            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context){

                deletetodo();
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete ,
              label: 'delete'.tr(),
            ),
          ]
      ),
      child: InkWell(
        onTap: (){

          Navigator.pushNamed(context, UpdateItem.updateitem,arguments: widget.todo);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: providermode.cuurrenttheme == ThemeMode.light ? Colors.white:Color(0xf141922),         //#
          ),
          child: Row(
            children: [
               Container(
                width: 4,
                height: 90,
                color: widget.todo.isDone? Color.fromRGBO(97, 231, 87, 1.0):MyTheme.primaryColor,
                margin: EdgeInsets.all(16),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.todo.title}",
                      style: widget.todo.isDone? Theme.of(context).textTheme.headline3: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${widget.todo.description}",
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "time".tr() +"${widget.todo.time.hour}:${widget.todo.time.minute}",
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: (){
                  if(!widget.todo.isDone) {
                    provider.updateisdone(widget.todo);
                    setState(() {});
                  }
                },
                child: widget.todo.isDone? Text('done'.tr(),
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromRGBO(97, 231, 87, 1.0),
                ),)
                    :Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MyTheme.primaryColor,
                  ),
                  child: Image.asset('assets/images/check.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deletetodo() {

    FirebaseFirestore.instance.collection('todos').doc(widget.todo.id).delete().timeout(Duration(milliseconds: 1),onTimeout: () {
      provider.fetchtodosFromfirestore();
    },);
  }
}
