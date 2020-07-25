
import 'package:cruddemo/CrudApp/create.dart';
import 'package:flutter/material.dart';

import 'CrudApp/crud_sample.dart';
import 'login.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
          accentColor: Colors.black,
          inputDecorationTheme: const InputDecorationTheme(

            hintStyle: TextStyle(color: Colors.black),
          )),


      // home: new WallScreen(analytics: analytics, observer: observer),
      home: new Add(),
    );
  }
}
