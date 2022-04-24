import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text.toString());

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
              labelText: 'Title',
              // hintText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value){
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                // hintText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
              ),
              onPressed: submitData,
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}