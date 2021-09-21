import 'package:bytebank2/components/centered_message.dart';
import 'package:bytebank2/components/progress.dart';
import 'package:bytebank2/http/webclients/transaction_webclient.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {

final TransactionWebClient webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<TransactionModel>>(
        future: Future.delayed(Duration(seconds: 1)).then((value) => webClient.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(
                message: 'Loading transactions',
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<TransactionModel>? transactions = snapshot.data;
              if (transactions!.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final TransactionModel transaction = transactions[index];
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text(
                          transaction.value.toString(),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transaction.contact.accountNumber.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                );
              }
          }
          return CenteredMessage('Unknow error');
        },
      ),
    );
  }
}
