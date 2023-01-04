import 'package:flutter/material.dart';

import './transaction.dart';
import 'package:intl/intl.dart';

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
          Column(
            children: transcations.map((tx) {
              return Card(
                child: Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Rs ${tx.amount}', // this form of writing a string is known as string interpolation
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple[200]),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ]),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
