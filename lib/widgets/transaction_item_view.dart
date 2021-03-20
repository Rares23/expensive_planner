import 'package:expense_planner/data/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItemView extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTransaction;

  TransactionItemView(
      {@required this.transaction, @required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(transaction.date),
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => deleteTransaction(transaction.id),
        ),
      ),
    );
  }
}
