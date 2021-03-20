import 'package:expense_planner/data/models/transaction.dart';
import 'package:expense_planner/widgets/new_transaction_form.dart';
import 'package:expense_planner/widgets/transactions_list_header_view.dart';
import 'package:expense_planner/widgets/transactions_list_view.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({@required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(
          days: 7,
        ),
      ));
    }).toList();
  }

  void _createTransaction(String title, double amount, DateTime date) {
    if (title.isNotEmpty && date != null) {
      setState(
        () {
          _transactions.add(
            Transaction(
              id: _transactions.length.toString(),
              title: title,
              amount: amount,
              date: date,
            ),
          );
        },
      );
    }
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransactionForm(createTransaction: _createTransaction)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          ),
        ],
      ),
      body: Column(
        children: [
          TransactionsListHeaderView(
            recentTransactions: _recentTransactions,
          ),
          TransactionsListView(
            transactions: _transactions,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
