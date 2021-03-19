import 'package:flutter/material.dart';

void main() => runApp(ExpensePlannerApp());

class ExpensePlannerApp extends StatelessWidget {
  final String title = 'Expense Planner';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
