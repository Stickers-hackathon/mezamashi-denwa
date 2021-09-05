import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'dart:math' as math;


class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact>? _contacts;
  var rand = new math.Random();
  

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    //連絡先を取得
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    //電話番号がある連絡先だけにする
    final Iterable<Contact> validContacts = contacts.where((e) => e.phones!.isNotEmpty);
    setState(() {
      _contacts = validContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text('電話をかける人')),
      ),
      body: _contacts != null ? ListView.builder(
        //ランダム用にループ回数を+1
        itemCount: _contacts != null ? _contacts!.length + 1 : 0,
        itemBuilder: (BuildContext context, int index) {
          Contact? contact;
          if (index == 0) {
            //1行目はランダム行
            return Container(
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white
              ),
              child: ListTile(
                title: const Text('ランダム'),
                onTap:  () {
                  Navigator.pop(context, ['ランダム', _contacts!.elementAt(rand.nextInt(_contacts!.length)).phones?.elementAt(0).value]);
                },
              ),
            );
          }else {
            //２行目以降は連絡先
            contact = _contacts!.elementAt(index-1);
            return Container(
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white
              ),
              child: ListTile(
                title: Text(contact.displayName ?? ''),
                subtitle: Text(contact.phones?.elementAt(0).value ?? ''),
                onTap:  () {
                  Navigator.pop(context, [contact?.displayName, contact?.phones?.elementAt(0).value]);
                },
              ),
            );
          }
        }
      )
          : Center(child: const CircularProgressIndicator()),
    );
  }
}