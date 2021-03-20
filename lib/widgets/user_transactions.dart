import 'package:expense_planner/data/models/transaction.dart';
import 'package:expense_planner/widgets/new_transaction_form.dart';
import 'package:expense_planner/widgets/transactions_list_header_view.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  List<Transaction> transactions = [];

  void createTransaction(String title, String amount) {
    if (title.isNotEmpty && amount.isNotEmpty) {
      transactions.add(
        Transaction(
          id: transactions.length.toString(),
          title: title,
          amount: double.parse(amount),
          date: DateTime.now(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionsListHeaderView(),
        NewTransactionForm(
          createTransaction: createTransaction,
        ),
      ],
    );
  }
}
