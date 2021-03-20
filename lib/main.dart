import 'package:expense_planner/pages/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:expense_planner/widgets/transaction_item_view.dart';
import 'package:expense_planner/data/transaction.dart';

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
