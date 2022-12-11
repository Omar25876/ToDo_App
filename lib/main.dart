import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

import 'layout/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home_layout.routeName : (context) => Home_layout(),
      },
      initialRoute: Home_layout.routeName,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
    );
  }
}
