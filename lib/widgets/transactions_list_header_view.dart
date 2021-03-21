import 'package:expense_planner/data/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expense_planner/widgets/chart_view.dart';

class TransactionsListHeaderView extends StatelessWidget {
  final List<Transaction> recentTransactions;

  TransactionsListHeaderView({@required this.recentTransactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Card(
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: constraints.maxHeight,
              width: double.infinity,
              child: ChartView(recentTransactions: recentTransactions),
            );
          },
        ),
        elevation: 5,
      ),
    );
  }
}
