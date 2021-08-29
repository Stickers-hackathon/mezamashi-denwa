import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';


class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact>? _contacts;

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    //Make sure we already have permissions for contacts when we get to this
    //page, so we can just retrieve it
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('電話をかける人')),
      ),
      body: _contacts != null ? ListView.builder(
        itemCount: _contacts != null ? _contacts!.length + 1 : 0,
        itemBuilder: (BuildContext context, int index) {
          Contact? contact;
          if (index == 0) {
            return Container(
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white
              ),
              child: ListTile(
                title: Text("ランダム"),
                onTap:  () {
                  Navigator.pop(context, ["ランダム", _contacts?.elementAt(0).phones?.elementAt(0).value]);
                },
              ),
            );
          }else {
            contact = _contacts?.elementAt(index-1);
            return Container(
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white
              ),
              child: ListTile(
                title: Text(contact?.displayName ?? ''),
                subtitle: Text(contact?.phones?.elementAt(0).value ?? ''),
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