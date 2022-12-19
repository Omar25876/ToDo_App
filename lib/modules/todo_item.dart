import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/shared/styles/my_theme.dart';
import '../models/todo_dm.dart';

class TodoItem extends StatelessWidget {
  TodoDM todo;

  TodoItem(this.todo);


  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [

            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (r){

              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete ,
              label: 'Delete',
            ),
          ]
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 90,
              color: MyTheme.primaryColor,
              margin: EdgeInsets.all(16),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${todo.title}",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${todo.description}",
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "time: ${todo.time.hour}:${todo.time.minute}",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyTheme.primaryColor,
              ),
              child: Image.asset('assets/images/check.png'),
            ),
          ],
        ),
      ),
    );
  }
}
