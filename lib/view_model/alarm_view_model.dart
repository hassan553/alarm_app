import 'dart:async';


import 'package:flutter/material.dart';

import '../widgets/show_alarm_dailog.dart';

class AlarmViewModel {
  var selectedTime;
  var _timer;
  var messageController=TextEditingController();

  void startTimer(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime scheduledTime = DateTime(
        now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }
    Duration duration = scheduledTime.difference(now);
    _timer = Timer(duration, () {
      // setState(() {
      //   red = Colors.amber;
      // });
      showAlarmDialog(context,messageController.text);
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }


}
