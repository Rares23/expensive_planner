import 'package:expense_planner/data/models/transaction.dart';
import 'package:expense_planner/widgets/chart_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartView extends StatelessWidget {
  final List<Transaction> recentTransactions;

  ChartView({@required this.recentTransactions});

  List<Map<String, Object>> get _groupedTransactionsByDay {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(
            days: index,
          ),
        );

        double totalSum = 0;

        for (int i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return _groupedTransactionsByDay.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ..._groupedTransactionsByDay.map((data) {
            print((data['amount'] as double));
            return Flexible(
              fit: FlexFit.tight,
              child: Container(
                child: ChartBarView(
                  label: data['day'],
                  spendingAmound: data['amount'],
                  spendingPctOfTotal: totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending,
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
