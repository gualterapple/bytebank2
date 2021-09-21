import 'dart:convert';

import 'package:bytebank2/http/webclient.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqlite_api.dart';

class TransactionWebClient
{

Future<List<TransactionModel>> findAll() async { 
  final Response response = await client.get(Uri.parse(baseUrl));
    final List<dynamic> decodedJson = jsonDecode(response.body); 

  return decodedJson
  .map((dynamic json) => TransactionModel.fromJson(json))
  .toList();
  
}


Future<TransactionModel> save(TransactionModel newTransaction) async
{
  final String trasactionJson = jsonEncode(newTransaction.toJson());
  final Response response =  await client.post(Uri.parse(baseUrl), 
  headers: {'Content-type': 'application/json', 'password':'1000'},
  body: trasactionJson);
  
  return TransactionModel.fromJson(jsonDecode(response.body));

}


}
