import 'package:flutter/cupertino.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:lisp_sync/resources/strings.dart';
import 'package:lisp_sync/resources/types.dart';
import 'package:lisp_sync/screens/exercise/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;
String cookie = '', nameTestTaker = '';
BuildContext contextLogin, contextHome;
CommonDataQuestion commonDataQuestion;
bool formatOther = false;
List<Exercise> testOfUser = [];
HtmlUnescape unescape = new HtmlUnescape();

AssetImage gifLoading = AssetImage(urlIconLoading);
