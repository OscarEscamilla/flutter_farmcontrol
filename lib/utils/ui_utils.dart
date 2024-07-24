

import 'package:flutter/material.dart';

void showSnackBar(String message, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}

void showCustomAlertDialog(BuildContext context, Function()? onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.logout, size: 50, color: Colors.tealAccent[700],),
          title: Text('Logout Confirmation', style: TextStyle(fontSize: 20),),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Are you sure you want to log out?'),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: onConfirm,
            ),
          ],
        );
      },
    );
  }