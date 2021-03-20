import 'package:flutter/material.dart';

class TransactionsListHeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        width: double.infinity,
        child: Text('CHART!'),
      ),
      elevation: 5,
    );
  }
}
