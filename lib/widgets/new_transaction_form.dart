import 'package:flutter/material.dart';

class NewTransactionForm extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function createTransaction;

  NewTransactionForm({@required this.createTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                createTransaction(titleController.text, amountController.text);
              },
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
