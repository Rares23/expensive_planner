import 'package:flutter/material.dart';

class NewTransactionForm extends StatefulWidget {
  final Function createTransaction;

  NewTransactionForm({@required this.createTransaction});

  @override
  _NewTransactionFormState createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  void _onDone() {
    String transactionTitle = titleController.text;
    double transactionAmount = double.parse(amountController.text);
    if (titleController.text.isNotEmpty && transactionAmount >= 0) {
      widget.createTransaction(
        transactionTitle,
        transactionAmount,
      );

      titleController.text = "";
      amountController.text = "";

      Navigator.of(context).pop();
    }
  }

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
              onSubmitted: (_) => _onDone(),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onDone(),
            ),
            TextButton(
              onPressed: _onDone,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
