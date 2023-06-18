import 'package:flutter/material.dart';

import '../view_model/alarm_view_model.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  AlarmViewModel alarmViewModel = AlarmViewModel();

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        alarmViewModel.selectedTime = picked;
      });
      alarmViewModel.cancelTimer();
      alarmViewModel.startTimer(context);
    }
  }

  @override
  void dispose() {
    alarmViewModel.cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm App'),
      ),
      body: Container(
        decoration:const  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.orange,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selected Time:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                alarmViewModel.selectedTime != null
                    ? '${alarmViewModel.selectedTime.format(context)}'
                    : 'Not set yet!',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
               Padding(
                padding:const  EdgeInsets.all(28.0),
                child:  TextField(
                  controller: alarmViewModel.messageController,
                  decoration:const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(100, 60)),
                ),
                onPressed: () {
                  selectTime(context);
                },
                child: const Text('Set Alarm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
