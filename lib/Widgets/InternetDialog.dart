import 'package:flutter/material.dart';

class InternetDialog{
  void showcontent(context) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Internet Problem'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('You have no internet connection.'),
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}