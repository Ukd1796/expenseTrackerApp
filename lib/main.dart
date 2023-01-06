import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';

import './widgets/transaction_list.dart';

import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors
              .purple, // this is used to generate all the different colors of the primary color mentioned to give an overall theme to the app
          accentColor: Colors.amber,
          fontFamily: 'QuickSand',
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                 fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
            )
          ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  late String titleInput;

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'task1',
    //   amount: 69.90,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'task2',
    //   amount: 99.90,
    //   date: DateTime.now(),
    // ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior
              .opaque, // does not close the sheet when tapped on it
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Personal Expenses',
            style: TextStyle(fontFamily: 'Open Sans'),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              // card takes a child width untill it has a parent width defined to it
              child: Container(
                // we used container because to assign the text a size and break the dependency it has
                width: double.infinity,
                child: Text('Chart'),
                color: Colors.blue,
              ),
              elevation: 5,
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
