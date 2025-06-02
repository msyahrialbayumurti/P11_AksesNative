import 'package:fitur_native/helpers/dbhelper.dart';
import 'package:fitur_native/helpers/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'entryform.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;
  List<Contact> _contactList = [];

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  void updateListView() {
    final Future<Database> dbFuture = DbHelper.db();
    dbFuture.then((database) {
      Future<List<Contact>> contactListFuture = DbHelper.getContactList();
      contactListFuture.then((contactList) {
        setState(() {
          _contactList = contactList;
          _count = contactList.length;
        });
      });
    });
  }

  void addContact(Contact contact) async {
    int result = await DbHelper.insert(contact);
    if (result > 0) {
      updateListView();
    }
  }

  void editContact(Contact contact) async {
    int result = await DbHelper.update(contact);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteContact(int id) async {
    int result = await DbHelper.delete(id);
    if (result > 0) {
      updateListView();
    }
  }

  Future<Contact> navigateToEntryForm(BuildContext context, Contact contact) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return EntryForm(contact);
        },
      ),
    );
    return result;
  }

  ListView createListView() {
    return ListView.builder(
      itemCount: _count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2.0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.people),
            ),
            title: Text(_contactList[index].name),
            subtitle: Text(_contactList[index].phone.toString()),
            trailing: GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () {
                deleteContact(_contactList[index].id!);
              },
            ),
            onTap: () async {
              var contact = await navigateToEntryForm(context, _contactList[index]);
              editContact(contact);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Coba Akses SQLite'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah Contact',
        onPressed: () async {
          var contact = await navigateToEntryForm(context, Contact("", ""));
          addContact(contact);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}