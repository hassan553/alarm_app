import 'package:alarm_app/view/alarm_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AlarmApp());

class AlarmApp extends StatelessWidget {
  const AlarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const  AlarmScreen(),
    );
  }
}
