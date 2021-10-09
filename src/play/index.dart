import 'package:http/http.dart' as http;

void main() async {
  var url = 'http://www.cs.utep.edu/cheon/cs3360/project/c4/play/';
  var pid = '602b5568e755b';
  var slot = '5';
  var response = await http.get(Uri.parse('$url?pid=$pid&move=$slot'));
  var statusCode = response.statusCode;
  if (statusCode < 200 || statusCode > 400) {
    print('Server connection failed ($statusCode).');
  } else {
    print('Response body: ${response.body}');
  }
}
