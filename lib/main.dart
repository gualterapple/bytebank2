import 'package:bytebank2/http/webclient.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
  //save(TransactionModel(200, Contact(0, 'Gui', 3459))).then((transaction) => print(transaction));
  //findAll().then((value) => print('Trasações: $value'));
}

class ByteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor:  Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: DashBoard()
    ); 
}
}

