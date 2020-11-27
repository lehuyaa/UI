import 'package:flutter/material.dart';
import 'package:lisp_sync/screens/login/ui.dart';
import 'package:lisp_sync/util/variable.dart';

void logout() {
  prefs.setString('cookie', '');
  Navigator.pushReplacement(
      contextHome, MaterialPageRoute(builder: (_) => Login.withDependency()));
  freeVariable();
}

void freeVariable() {
  // commonDataQuestion = null;
  contextHome = null;
  //testOfUser = [];
  prefs = null;
  cookie = '';
  nameTestTaker = '';
}
