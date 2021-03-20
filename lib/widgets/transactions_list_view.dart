import 'package:expense_planner/data/models/transaction.dart';
import 'package:expense_planner/widgets/transaction_item_view.dart';
import 'package:flutter/material.dart';

class TransactionsListView extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsListView({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((Transaction transaction) {
        return TransactionItemView(transaction: transaction);
      }).toList(),
    );
  }
}
