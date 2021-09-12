import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:mezamashi_denwa/call.dart';
import 'package:mezamashi_denwa/state/alarm_list.dart';
import 'package:mezamashi_denwa/storage/alarm_list.dart';
import 'package:provider/provider.dart';
import 'detail.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:intl/intl.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project

String? selectedNotificationPayload;

Future<void> main() async {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

  await _configureLocalTimeZone();

  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          debugPrint('notification payload: $payload');
        }
        selectedNotificationPayload = payload;
      });

  await AndroidAlarmManager.initialize();

  runApp(MyApp());
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
}

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
        title: Text("${alarm.time}"),
        subtitle: Text(alarm.name),
        onChanged: (bool value) async {
          final storage = Storage();
          final successful = await storage.updateAlarm(Alarm().copyWith(
              id: alarm.id, name: alarm.name, time: alarm.time, on: value));
          var t = alarm.time;
          final format = t[t.length-1] == 'M' ? DateFormat.jm() : DateFormat.Hm();
          TimeOfDay schedule = TimeOfDay.fromDateTime(format.parse(alarm.time));
          if (successful)
            context.read<AlarmListStateNotifier>().updateAlarmActivate(i);
          alarm.on ? _cancelNotification() : _zonedScheduleNotification(schedule, i);
        });
  }
}

Future<void> _zonedScheduleNotification(TimeOfDay t, int i) async {
  tz.TZDateTime _nextInstanceOfTime() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, t.hour, t.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  await flutterLocalNotificationsPlugin.zonedSchedule(
      i,
      'scheduled title',
      'scheduled body',
      _nextInstanceOfTime(),
      const NotificationDetails(
          android: AndroidNotificationDetails('your channel id',
              'your channel name', 'your channel description')),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime);

  await AndroidAlarmManager.periodic(const Duration(seconds: 15), 0, printHello);
}

Future<void> _cancelNotification() async {
  await flutterLocalNotificationsPlugin.cancel(0);
}

Future<void> printHello() async {
  final DateTime now = DateTime.now();
  print("[$now] Hello, world! function='$printHello'");
}