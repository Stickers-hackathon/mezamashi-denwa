import 'package:flutter/material.dart';
import 'package:mezamashi_denwa/state/alarm_list.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'contacts.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),
        body: ChangeForm() //ChangeForm()
        );
  }
}

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => new _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  String _name = "未選択";
  String _phoneNumber = "";
  String _time = "00:00";
  Map<String, bool> _check = {
    'sound': false,
    'vibration': false,
    'name': false
  };

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          TextButton(
            child: Text(_time),
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () async {
              final TimeOfDay timeOfDay = (await showTimePicker(
                  context: context, initialTime: TimeOfDay.now()))!;
              if (timeOfDay != null)
                setState(() => {_time = timeOfDay.format(context)});
            },
          ),
          Column(children: <Widget>[
            _buildTile("アラーム音", "beep", "sound"),
            _buildTile("バイブ", "basic call", "vibration"),
            ListTile(
                title: const Text("誰に電話をかける？"),
                subtitle: Text(_name),
                onTap:  () async {
                  //権限の確認
                  final PermissionStatus permissionStatus = await _getPermission();
                  if (permissionStatus == PermissionStatus.granted) {
                    //連絡先アクセスの許可がある時一覧ページに遷移
                    final result = await Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ContactsPage()));
                    setState(() {
                      _name = result[0];
                      _phoneNumber = result[1];
                    });
                  } else {
                    //連絡先アクセスの許可がない時その旨を表示
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Permissions error'),
                          content: const Text('Please enable contacts access '
                              'permission in system settings'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text('OK'),
                              onPressed: () => Navigator.of(context).pop(),
                            )
                          ],
                        ));
                  }
                },
              ),
          ]),
          Row(children: <Widget>[
            TextButton(
              child: const Text('キャンセル'),
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('保存'),
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context, Alarm().copyWith(time: _time, name: _name, phoneNumber: _phoneNumber,on: false));
              },
            ),
          ])
        ]));
  }

  Widget _buildTile(String title, String sub, String type) {
    return SwitchListTile(
        value: _check[type]!,
        activeColor: Colors.orange,
        activeTrackColor: Colors.red,
        inactiveThumbColor: Colors.blue,
        inactiveTrackColor: Colors.grey,
        title: Text(title),
        subtitle: Text(sub),
        onChanged: (bool value) => setState(() {
              _check[type] = value;
              print("value: $value");
            }));
  }
}


//Check contacts permission
Future<PermissionStatus> _getPermission() async {
  final PermissionStatus permission = await Permission.contacts.status;
  if (permission != PermissionStatus.granted) {
    final Map<Permission, PermissionStatus> permissionStatus =
    await [Permission.contacts].request();
    return permissionStatus[Permission.contacts] ??
        PermissionStatus.denied;
  } else {
    return permission;
  }
}