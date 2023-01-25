import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/todo_dm.dart';



class TodoProvider extends ChangeNotifier{

  DateTime selectedDay = DateTime.now();

  List<TodoDM> todos = [];

  fetchtodosFromfirestore() async {
    var todoscollection = FirebaseFirestore.instance.collection('todos');
    var query = await todoscollection.get();
    print("Fetch");
    todos = query.docs.map((doc) {
      var map = doc.data();
      return TodoDM(
          id: doc.id,
          title: map["title"],
          description: map["description"],
          time: DateTime.fromMillisecondsSinceEpoch(map["time"]),
          isDone: map["isDone"]);
    }).toList();

    todos = todos.where((todo) {

      if(todo.time.year == selectedDay.year && todo.time.month == selectedDay.month && todo.time.day == selectedDay.day){
        print(todo.time);
        return true;
      }
      return false;
    }).toList();
    notifyListeners();
  }


  selectedDateupdate(DateTime newDate){
    selectedDay = newDate;
    fetchtodosFromfirestore();
  }


  updatetodo(TodoDM todo){
    FirebaseFirestore.instance.collection('todos')
        .doc(todo.id).update({
      'id' : todo.id,
      'title' : todo.title,
      'description' : todo.description,
      'time' : todo.time.millisecondsSinceEpoch,
      'isDone' : todo.isDone,
    }
    ).timeout(Duration(milliseconds: 500),onTimeout: (){
      fetchtodosFromfirestore();
    });

  }

  updateisdone(TodoDM todo){
    FirebaseFirestore.instance.collection('todos')
        .doc(todo.id).update({
      'isDone' : true
    }).timeout(Duration(milliseconds: 500),onTimeout: (){
      fetchtodosFromfirestore();

    });

  }



}