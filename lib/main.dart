import 'package:flutter/material.dart';
import 'alarm.dart';
import 'detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeForm(),
    );
  }
}

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => new _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  List<Alarm> _alarmList = [
    Alarm('8:00', 'かける人', false),
    Alarm('９：００', 'かける人', false),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Startup Name Generator'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail()),
              );
              setState(() {
                if (result != null) _alarmList.add(result);
              });
            },
          )
        ]),
        body: _buildList(context));
  }

  Widget _buildList(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: _alarmList.length,
          itemBuilder: (context, index) {
            return _buildTile(_alarmList[index].on, index);
          },
        ));
  }

  Widget _buildTile(bool a, int i) {
    return SwitchListTile(
        value: a,
        activeColor: Colors.orange,
        activeTrackColor: Colors.red,
        inactiveThumbColor: Colors.blue,
        inactiveTrackColor: Colors.grey,
        secondary: new IconButton(
            icon: Icon(
              Icons.block,
              color: Colors.grey[500],
              size: 45.0,
            ),
            onPressed: () => setState(() => _alarmList.removeAt(i))),
        title: Text(_alarmList[i].time),
        subtitle: Text(_alarmList[i].name),
        onChanged: (bool value) => setState(() {
              _alarmList[i].on = !_alarmList[i].on;
              print("i: $i , a: $a");
              print("_activeList: $_alarmList");
              print("value: $value");
            }));
  }
}
