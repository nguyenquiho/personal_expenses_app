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
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(radius: 30, 
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FittedBox(
                    child: Text('${transactions[index].amount}₫')
                    ),
                )
              ),
              title: Text(transactions[index].title.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(DateFormat.yMMMd().format(DateTime.parse(transactions[index].date.toString()))),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}