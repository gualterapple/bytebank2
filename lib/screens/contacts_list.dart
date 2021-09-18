import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screens/contact_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranfer')
        ),
        body: FutureBuilder(
          //initialData: [],
          future: _dao.findAll(),
          builder: (context, snapshot)
        {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
            break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot.data as List<Contact>;
              
              return ListView.builder(
                itemBuilder: (context, index)
                {
                  final Contact contact = contacts![index];
                  return _ContactItem(contact);
                },
                itemCount: contacts?.length,
              );
            break;
          }
          return Text('Unknow error');
        }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ContactForm())).then((newContact) => setState((){}));
          },
          child: Icon(Icons.add),
        ),
    );
  }
}

class _ContactItem extends StatelessWidget {

  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
              child: 
              ListTile(
                title: Text(
                  contact.name, 
                  style: TextStyle(
                    fontSize: 24.0),),
                subtitle: Text(contact.accountNumber.toString(), style: TextStyle(
                  fontSize: 16.0),),),
            );
  }
}