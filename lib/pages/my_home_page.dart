import 'package:expense_planner/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: UserTransactions(),
    );
  }
}
