import 'package:lisp_sync/resources/strings.dart';
import 'package:lisp_sync/resources/types.dart';
import 'package:lisp_sync/screens/login/api.dart' as api;
import 'package:lisp_sync/screens/login/data.dart';
import 'package:lisp_sync/util/variable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

class LoginController extends StateNotifier<LoginData> {
  LoginController() : super(LoginData());
  Future<String> login() async {
    LoginData st = state;
    final response = await api.login(login: st.name, password: st.password);
    if (response is AppError) {
      return response.description;
    }
    final htmlBody = response.body;
    if (htmlBody.indexOf("Invalid login or password. Please try again.") !=
        -1) {
      return wrongLogin;
    } else if (htmlBody.indexOf("This field is required") != -1 ||
        htmlBody.indexOf('\'error\': ""') != -1) {
      return missLogin;
    } else {
      cookie = response.headers['set-cookie'];
      cookie = cookie.substring(cookie.indexOf('tao_xS2lIq62'));
      prefs = await SharedPreferences.getInstance();
      prefs.setString('cookie', cookie);
      return '';
    }
  }

  void setName(String name) {
    LoginData st = state;
    st.name = name;
  }

  void setPassword(String password) {
    LoginData st = state;
    st.password = password;
  }
}
