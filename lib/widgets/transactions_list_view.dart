import 'package:expense_planner/data/models/transaction.dart';
import 'package:expense_planner/widgets/transaction_item_view.dart';
import 'package:flutter/material.dart';

class TransactionsListView extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsListView({@required this.transactions});

  Widget buildNoTransactionsView(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          height: 130,
          child: Image.asset(
            'assets/images/broke.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'No transactions',
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }

  Widget buildList(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) =>
            TransactionItemView(transaction: transactions[index]),
        itemCount: transactions.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? buildNoTransactionsView(context)
        : buildList(context);
  }
}
