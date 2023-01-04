import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transcations = [
    Transaction(
      id: 't1',
      title: 'task1',
      amount: 69.90,
      date: DateTime.now(),
    ),
      Transaction(
      id: 't2',
      title: 'task2',
      amount: 99.90,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
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
          Column(children:transcations.map((tx) {
            return Card(child:Text(tx.title),
            );
          }).toList(),
        
      ),
        ],
      ),
    );
  }
}
