import 'package:flutter/material.dart';
import 'package:flutter_personal_money_app/widgets/chart_bar.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transactions> userTransactions;
  Chart(this.userTransactions);
  List<Map<String, dynamic>> get generateTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var tx in userTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return generateTransactions.fold(0.0, (double previousValue, data) {
      return previousValue + (data['amount'] as num).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(generateTransactions);
    return Container(
      height: 160,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...generateTransactions.map((value) {
              return Flexible(
                fit: FlexFit.loose,
                child: ChartBar(
                  value['day'] as String,
                  (value['amount'] as num).toDouble(),
                  totalSpending == 0.0
                      ? 0.0
                      : (value['amount'] as num).toDouble() / totalSpending,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
