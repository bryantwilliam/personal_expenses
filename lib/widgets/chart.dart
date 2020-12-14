import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;
      for (var recentTrans in recentTransactions) {
        final rtDate = recentTrans.date;
        if (rtDate.day == weekDay.day &&
            rtDate.month == weekDay.month &&
            rtDate.year == weekDay.year) {
          totalSum += recentTrans.amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
