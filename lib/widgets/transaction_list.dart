import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(
        children: [
          Text('No Transactions added yet!', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)
          ),
        ],
      ) : ListView.builder(
        itemBuilder: (contex, index){
          return Card(
            // child: Text(tx.title.toString()),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                  ),
                  child: Text(
                    '\$${transactions[index].amount?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        DateFormat.yMMMd().format(DateTime.parse(transactions[index].date.toString())),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ]
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}