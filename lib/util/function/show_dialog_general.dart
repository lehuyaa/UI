import 'package:flutter/material.dart';
import 'package:lisp_sync/resources/strings.dart';

//import 'package:lisp_sync/screens/test/ui.dart';
import 'package:lisp_sync/util/function/logout.dart';
import 'package:lisp_sync/widgets/show_error.dart';

void showDialogOfApp(BuildContext context,
    {String error, Function onRetry, Type typeWidgetCurrent}) {
  if (error == noNetwork)
    _showDialogNoNetwork(context, onRetry);
  else if (error == cookieExpiredApp)
    _showDialogLogout(context, typeWidgetCurrent);
  else if (error == wrongLogin || error == missLogin || error == errorRoleApp)
    _showDialogWarningAccount(context, error);
  else if (error == clientError) _showDialogClientError(context, onRetry);
}

void _showDialogClientError(BuildContext context, Function onRetry) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ShowError(error: clientError, actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK')),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  onRetry();
                },
                child: Text('Thử lại'))
          ]));
}

void _showDialogWarningAccount(BuildContext context, String error) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ShowError(error: error, actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ]));
}

void _showDialogLogout(BuildContext context, Type typeWidgetCurrent) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ShowError(error: cookieExpiredApp, actions: [
            FlatButton(
                onPressed: () {
                  // if (typeWidgetCurrent == Test) Navigator.pop(context);
                  Navigator.pop(context);
                  logout();
                },
                child: Text('Đăng xuất'))
          ]));
}

void _showDialogNoNetwork(BuildContext context, Function onRetry) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ShowError(error: noNetwork, actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK')),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  onRetry();
                },
                child: Text('Thử lại'))
          ]));
}
