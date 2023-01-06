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
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset('assets/images/waiting.png'))
                ],
              )
            : ListView.builder(
                // list view builder while scrolling only shows the list that can be seen by the user and does not build the complete list. It is usable for long list because it is the optimum approach
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 50,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Rs ${transactions[index].amount.toStringAsFixed(2)}', // this form of writing a string is known as string interpolation
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
