import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionForm extends StatefulWidget {
  final Function createTransaction;

  NewTransactionForm({@required this.createTransaction});

  @override
  _NewTransactionFormState createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime _selectedDate;

  void _onDone() {
    String transactionTitle = _titleController.text;
    double transactionAmount = double.parse(_amountController.text);
    if (_titleController.text.isNotEmpty && transactionAmount >= 0) {
      widget.createTransaction(
          transactionTitle, transactionAmount, _selectedDate);

      _titleController.text = "";
      _amountController.text = "";

      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _onDone(),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onDone(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Not Date Selected!'
                          : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    onPressed: () => _presentDatePicker(context),
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _onDone,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
