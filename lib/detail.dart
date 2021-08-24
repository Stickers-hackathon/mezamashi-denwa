import 'package:flutter/material.dart';
import 'package:mezamashi_denwa/state/alarm_list.dart';

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
  TimeOfDay _time = TimeOfDay.now();
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
            child: Text("${_time.hour}:${_time.minute}"),
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () async {
              final TimeOfDay timeOfDay = (await showTimePicker(
                  context: context, initialTime: TimeOfDay.now()))!;
              if (timeOfDay != null)
                setState(() => {_time = timeOfDay});
            },
          ),
          Column(children: <Widget>[
            _buildTile("アラーム音", "beep", "sound"),
            _buildTile("バイブ", "basic call", "vibration"),
            _buildTile("かける相手指定", "jeep", "name"),
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
                Navigator.pop(context, Alarm().copyWith(time: _time, name: "コーリングマン", on: false));
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
