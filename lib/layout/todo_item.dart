import 'package:flutter/material.dart';

import '../models/todo_dm.dart';

class TodoItem extends StatelessWidget {
  TodoDM todo ;

  TodoItem(this.todo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12,horizontal:20 ),
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 80,
            color: Colors.cyan,
            margin: EdgeInsets.all(12),
          ),
          Spacer(flex: 1,),
          Column(
            children: [
              Text("${todo.title}",style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.start,),
              Text("${todo.description}",style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.start,),
              Text("${todo.time}",style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.start,),
            ],
          ),
         Spacer(flex: 2,),
         Container(
           padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12),
             color: Theme.of(context).colorScheme.primary,
           ),
           child: Image.asset('assets/images/check.png'),
         ),
          Spacer(flex: 1,),
        ],
      ),
    );
  }
}
