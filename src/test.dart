import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert' as JSON;

void main() {
  Generate a = new Generate();
  a.test2();
}

class Generate {
  void test2() async {
    var pid;
    var url = 'http://www.cs.utep.edu/cheon/cs3360/project/c4/new/';
    print('Connecting To ' + url);
    Strategy strats = new Strategy();
    var choice = strats.select();
    var newurl = url + choice;
    var response = await http.get(Uri.parse('$newurl'));
    var statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      print('Server Connection Failed ($statusCode).');
    } else {
      var response2 = JSON.jsonDecode(response.body) as Map<String, dynamic>;
      pid = response2['pid'];
    }
    print("Enter a move slot");
    Slot move = new Slot();
    var move2 = move.select_slot();
    var playurl =
        'http://www.cs.utep.edu/cheon/cs3360/project/c4/play/?pid=' + pid;
    print(playurl);
    var playurl2 = playurl + '&move=' + move2;
    var response2 = await http.get(Uri.parse('$playurl2'));
    var statusCode2 = response2.statusCode;
    if (statusCode2 < 200 || statusCode2 > 400) {
      print('Server Connection Failed ($statusCode2).');
    } else {
      print('Response body: ${response2.body}');
    }
  }
}

class Strategy {
  String select() {
    print("Select A Strategy:");
    print("1. Smart");
    print("2. Random");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        {
          print("Smart Strategy Selected");
        }
        return '?strategy=Smart';

      case '2':
        {
          print("Random Strategy Selected");
        }
        return '?strategy=Randon';

      default:
        {
          print("Invalid Choice");
        }
        return "";
        break;
    }
  }
}

class Slot {
  String select_slot() {
    print("Select a slot");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '0':
        {
          print("Slot " + choice);
        }
        return '0';
      case '1':
        {
          print("Slot" + choice);
        }
        return '1';
      case '2':
        {
          print("Slot " + choice);
        }
        return '2';
      case '3':
        {
          print("Slot" + choice);
        }
        return '3';
      case '4':
        {
          print("Slot " + choice);
        }
        return '4';
      case '5':
        {
          print("Slot" + choice);
        }
        return '5';
      case '6':
        {
          print("Slot" + choice);
        }
        return '6';
      default:
        {
          print("Invalid Slot");
        }
        break;
    }
  }
}

class Board {}
