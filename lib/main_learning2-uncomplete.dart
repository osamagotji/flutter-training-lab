import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(
        id: 't1',
        title: 'Pay for Krapao Kai',
        amount: 200,
        date: DateTime.now(),
        reason: 'I\'m hungry'),
    Transaction(
        id: 't2',
        title: 'Buy the new notebook',
        amount: 20000,
        date: DateTime.now(),
        reason: 'I need to work'),
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: MyHomePage(transactions),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  // Property
  final List<Transaction> transactions;
  // List<Transaction> transactions = [this.transactions];

  // Constructor
  MyHomePage(this.transactions);

  // Method for slow alert dialog
  showAlertDialog(BuildContext context, String title, String text) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var amountController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // inputFormatters: ,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            MaterialButton(
              onPressed: () {
                var inputTitle = titleController.text;
                var inputAmount = amountController.text;

                print('Button clicked');
                print('Input title = $inputTitle');
                print('Input amount = $inputAmount');

                // Alert only one at a time
                if (inputTitle.length == 0)
                  showAlertDialog(context, 'Error', 'Input title is empty');
                else if (inputAmount.length == 0)
                  showAlertDialog(context, 'Error', 'Input amount is empty');
                else {
                  Transaction inputTransaction = Transaction(
                      id: 'xx',
                      title: inputTitle,
                      amount: double.parse(inputAmount),
                      date: DateTime.now(),
                      reason: null);
                  transactions.add(inputTransaction);
                }
              },
              child: Text('Add to the list'),
              color: Colors.red,
            ),
            ...transactions.map((tx) {
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.album),
                      title: Text('${tx.id} - ' +
                          new DateFormat('MMM dd,yyyy').format(tx.date)),
                      subtitle: Text(
                          '${tx.title} --> ${tx.amount.toString()}\n${tx.reason}'),
                    ),
                  ],
                ),
              );
            }).toList()
          ])),
    );
  }
}
