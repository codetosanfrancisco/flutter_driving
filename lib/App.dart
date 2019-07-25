import 'package:flutter/material.dart';
import './src/containers/ListPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Driving App",
        home: ListPage(title: "Lessons"),
        theme: ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)));
  }
}
