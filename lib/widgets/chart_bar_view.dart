import 'package:flutter/material.dart';

class ChartBarView extends StatelessWidget {
  final String label;
  final double spendingAmound;
  final double spendingPctOfTotal;

  ChartBarView({
    @required this.label,
    @required this.spendingAmound,
    @required this.spendingPctOfTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 16,
          child: FittedBox(
            child: Text('\$${spendingAmound.toStringAsFixed(2)}'),
          ),
        ),
        Expanded(
          child: Container(
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
