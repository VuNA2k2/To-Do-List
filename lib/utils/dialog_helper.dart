import 'package:flutter/material.dart';
import 'package:todo_list/languages/language.dart';

class DialogHelper {

  static bool _isShowing = false;
  static void showSimpleDialog(BuildContext context, String title, String message) {
    if(_isShowing) return;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
        );
      },
    );
  }

  static void showConfirmDialog(BuildContext context, String title, String message, Function onConfirm) {
    if(_isShowing) return;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(L.current.cancel)
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: Text(L.current.ok)
            )
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  static void showLoadingDialog(BuildContext context) {
    if (_isShowing) return;
    _isShowing = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 20,),
              Text(L.current.loading)
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    if(_isShowing) {
      Navigator.of(context).pop();
      _isShowing = false;
    }
  }

  static void showOptionDialog(BuildContext context, String title, List<String> options, Function(int) onSelected) {
    if(_isShowing) return;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: options.map((e) => TextButton(
              onPressed: () {
                onSelected(options.indexOf(e));
                Navigator.of(context).pop();
              },
              child: Text(e),
            )).toList(),
          )
        );
      },
    );
  }
}