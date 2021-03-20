import 'package:flutter/material.dart';

class TransactionsListHeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Container(
        width: double.infinity,
        child: Text('CHART!'),
      ),
      elevation: 5,
    );
  }
}
