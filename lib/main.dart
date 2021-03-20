import 'package:expense_planner/pages/my_home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpensePlannerApp());

class ExpensePlannerApp extends StatelessWidget {
  final String title = 'Expense Planner';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.orange,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(title: title),
    );
  }
}
