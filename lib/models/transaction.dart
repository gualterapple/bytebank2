
import 'package:sqflite/sqlite_api.dart';

import 'contact.dart';

class TransactionModel {
  final double value;
  final Contact contact;

  TransactionModel(
    this.value,
    this.contact,
  );

  TransactionModel.fromJson(Map<String, dynamic> json) :
  value = json['value'],
  contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
    'value': value,
    'contact': contact.toJson(),
  };

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

}