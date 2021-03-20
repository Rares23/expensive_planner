class TransactionsListView extends StatefulWidget {
  @override
  _TransactionsListViewState createState() => _TransactionsListViewState();
}

class _TransactionsListViewState extends State<TransactionsListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((Transaction transaction) {
        return TransactionItemView(transaction: transaction);
      }).toList(),
    );
  }
}
