import 'package:flutter/material.dart';
import 'package:mezamashi_denwa/state/alarm_list.dart';
import 'package:provider/provider.dart';
import 'detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AlarmList>(
      create: (context) => AlarmList(),
      child: MaterialApp(
        home: _ChangeFormState(),
      ),
    );
  }
}

class _ChangeFormState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AlarmList data = Provider.of<AlarmList>(context);

    return Scaffold(
        appBar: AppBar(title: Text('Startup Name Generator'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail()),
              );
              if (result != null) data.pushAlarmList(result);
            },
          )
        ]),
        body: _buildList(context));
  }

  Widget _buildList(BuildContext context) {
    final AlarmList data = Provider.of<AlarmList>(context);
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: data.getAlarmListLength(),
          itemBuilder: (context, index) {
            return _buildTile(data.getAlarmActiveInfo(index), index, context);
          },
        ));
  }

  Widget _buildTile(bool a, int i, BuildContext context) {
    final AlarmList data = Provider.of<AlarmList>(context);
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
            onPressed: () => data.removeAlarmListItem(i)),
        title: Text(data.getAlarmTime(i)),
        subtitle: Text(data.getAlarmName(i)),
        onChanged: (bool value) {
          data.updateAlarmActivate(i);
          print("i: $i , a: $a");
          print("value: $value");
        });
  }
}
