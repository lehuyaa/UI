import 'package:http/http.dart' as http;
import 'package:lisp_sync/resources/strings.dart';
import 'package:lisp_sync/util/function/convert_response.dart';
import 'package:lisp_sync/util/variable.dart';

Future<dynamic> getTests() async {
  try {
    final http.Response response = await _getTests();
    return convertResponse2(response);
  } on Exception catch (e) {
    return convertResponseException(e);
  }
}

Future<http.Response> _getTests() async {
  return await http.get('http://$baseUrl/taoDelivery/DeliveryServer/index',
      headers: {'Cookie': cookie});
}
