import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:mezamashi_denwa/state/alarm_list.dart';
import 'package:provider/provider.dart';
import 'detail.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<AlarmListStateNotifier, AlarmList>(
      create: (context) => AlarmListStateNotifier(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class _ChangeFormState extends StatelessWidget {
  @override
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
            onPressed: () =>
                context.read<AlarmListStateNotifier>().removeAlarmListItem(i)),
        title: Text(alarm.time),
        subtitle: Text(alarm.name),
        onChanged: (bool value) {
          context.read<AlarmListStateNotifier>().updateAlarmActivate(i);
          print("value: $value");
        });
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid =
    new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // notification
  Future _showNotification() async {
    var time = new Time(8, 0, 0);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Timer',
      'You should check the app',
      time,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void _setSchedular() {
    _showNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Hello World',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setSchedular,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
