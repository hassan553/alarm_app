import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlarmDialog(BuildContext context,String message){
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title:const  Text('Alarm'),
      content:  Text(message),
      actions: [
        TextButton(
          child: const Text('Dismiss'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}