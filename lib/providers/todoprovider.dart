import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/todo_dm.dart';



class TodoProvider extends ChangeNotifier{

  DateTime selectedDay = DateTime.now();

  List<TodoDM> todos = [];

  fetchtodosFromfirestore() async {
    var todoscollection = FirebaseFirestore.instance.collection('todos');
    var query = await todoscollection.get();

    query.docs.map((doc) {
      var map = doc.data();
      return TodoDM(
          id: map["id"],
          title: map["title"],
          description: map["description"],
          time: DateTime.fromMicrosecondsSinceEpoch(map["time"]),
          isDone: map["isDone"]);
    }).toList();

    todos.where((todo) {
      return todo.time.year == selectedDay.year &&
          todo.time.month == selectedDay.month && todo.time.hour == selectedDay.hour;
    }).toList();
    notifyListeners();
  }


  selectedDateupdate(DateTime newDate){
    selectedDay = newDate;
    fetchtodosFromfirestore();
  }



}