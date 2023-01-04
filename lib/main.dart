import './widgets/user_transaction.dart';

import 'package:flutter/material.dart';

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
//  late String titleInput;
//  late String amountInput;

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
          UserTransactions()
        ],
      ),
    );
  }
}
