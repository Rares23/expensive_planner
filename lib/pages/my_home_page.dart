import 'package:expense_planner/data/transaction.dart';
import 'package:expense_planner/widgets/new_transaction_form.dart';
import 'package:expense_planner/widgets/transaction_item_view.dart';
import 'package:expense_planner/widgets/transactions_list_header_view.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: "1", title: "New Shoes", amount: 125, date: DateTime.now()),
    Transaction(id: "2", title: "Grocery", amount: 50.51, date: DateTime.now())
  ];
  final String title;
  MyHomePage({@required this.title});

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
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            TransactionsListHeaderView(),
            NewTransactionForm(
              createTransaction: createTransaction,
            ),
            Column(
              children: transactions.map((Transaction transaction) {
                return TransactionItemView(transaction: transaction);
              }).toList(),
            )
          ],
        ));
  }
}
