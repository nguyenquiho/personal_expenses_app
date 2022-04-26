import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues{ /* ... */
    return List.generate(7, (index) { /* ... */
      final weekDay = DateTime.now().subtract(Duration(days: index),);  /* ... */
      // print(weekDay); //2022-04-21 15:39:47.257766
      double totalSum = 0.0;

      for (int i = 0; i < recentTransactions.length; i++){
        if(recentTransactions[i].date!.day == weekDay.day && 
          recentTransactions[i].date!.month == weekDay.month && 
          recentTransactions[i].date!.year == weekDay.year){
            totalSum += recentTransactions[i].amount!.toDouble();
        }
      }


      // print(DateFormat.E().format(weekDay)); //Thu
      // print(totalSum); //0.0

      return {
        'day': DateFormat.E().format(weekDay).substring(0,1),
        'amount': totalSum
        };
    }).reversed.toList();
  }

  double get totalSpending{
    return groupedTransactionValues.fold(0.0, (sum, item){
      return sum + (item["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues); 
    // [{day: Tue, amount: 12.0}, {day: Mon, amount: 0.0}, {day: Sun, amount: 0.0}, {day: Sat, amount: 0.0}, {day: Fri, amount: 0.0}, {day: Thu, amount: 0.0}, {day: Wed, amount: 0.0}]
    return Card(
      elevation: 6, 
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues.map((data){
            // return Text('${data['day']}: ${data['amount']}');
            return Flexible(
              // fit: FlexFit.loose, // fit phần tử theo with của nó
              fit: FlexFit.tight, //fit phần tử theo flexible(tương ứng trong này là flex:1 cho mỗi thanh chart bar)
              child: ChartBar(data['day'] as String, data['amount'] as double, totalSpending == 0 ? 0 : (data["amount"] as double) / totalSpending)
            );
          }).toList(),
        ),
      ),
    );
  }
}