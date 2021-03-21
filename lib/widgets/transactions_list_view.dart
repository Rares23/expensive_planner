import 'package:expense_planner/data/models/transaction.dart';
import 'package:expense_planner/widgets/transaction_item_view.dart';
import 'package:expense_planner/widgets/transactions_list_header_view.dart';
import 'package:flutter/material.dart';

class TransactionsListView extends StatelessWidget {
  final List<Transaction> transactions;
  final List<Transaction> recentTransactions;
  final Function deleteTransaction;

  TransactionsListView({
    @required this.transactions,
    @required this.recentTransactions,
    @required this.deleteTransaction,
  });

  Widget buildNoTransactionsView(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
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
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          if (transactions.isEmpty) {
            return Column(
              children: [
                TransactionsListHeaderView(
                  recentTransactions: recentTransactions,
                ),
                buildNoTransactionsView(context),
              ],
            );
          } else {
            return TransactionsListHeaderView(
              recentTransactions: recentTransactions,
            );
          }
        } else {
          return TransactionItemView(
            transaction: transactions[index - 1],
            deleteTransaction: deleteTransaction,
          );
        }
      },
      itemCount: transactions.length + 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildList(context);
  }
}
