import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:mezamashi_denwa/call.dart';
import 'package:mezamashi_denwa/state/alarm_list.dart';
import 'package:mezamashi_denwa/storage/alarm_list.dart';
import 'package:provider/provider.dart';
import 'detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<AlarmListStateNotifier, AlarmList>(
      create: (context) => AlarmListStateNotifier(),
      child: MaterialApp(
        home: _ChangeFormState(),
      ),
    );
  }
}

class _ChangeFormState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var initialState = context.read<AlarmListStateNotifier>().state.alarmList;
    if (initialState.isEmpty) {
      () async {
        final storage = new Storage();
        initialState = await storage.getAlarmList();
        context.read<AlarmListStateNotifier>().setAlarmList(initialState);
      }();
    }

    return Scaffold(
        appBar: AppBar(title: Text('Startup Name Generator'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone_forwarded),
            onPressed: () {
              phoneCallPopUp(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail()),
              );
              if (result != null)
                context.read<AlarmListStateNotifier>().addAlarmList(result);
            },
          )
        ]),
        body: _buildList(context));
  }

  Widget _buildList(BuildContext context) {
    final alarmListState =
        context.select<AlarmList, List<Alarm>>((state) => state.alarmList);

    return Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: alarmListState.length,
          itemBuilder: (context, index) {
            return Builder(builder: (context) {
              return _buildTile(alarmListState[index], index, context);
            });
          },
        ));
  }

  Widget _buildTile(Alarm alarm, int i, BuildContext context) {
    return SwitchListTile(
        value: alarm.on,
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
            onPressed: () async {
              final storage = Storage();
              storage.deleteAlarm(alarm.id);
              context.read<AlarmListStateNotifier>().removeAlarmListItem(i);
            }),
        title: Text(alarm.time),
        subtitle: Text(alarm.name),
        onChanged: (bool value) async {
          final storage = Storage();
          final successful = await storage.updateAlarm(Alarm().copyWith(
              id: alarm.id, name: alarm.name, time: alarm.time, on: value));
          if (successful)
            context.read<AlarmListStateNotifier>().updateAlarmActivate(i);
        });
  }
}
