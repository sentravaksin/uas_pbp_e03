import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
// import 'dart:math';

//https://reqres.in/api/users?page=2
//https://reqres.in/api/users/2
String url = 'https://reqres.in/api/users/';
var random = Random();

class User {
  String id;
  String email = '';
  String name = '';
  String avatar = '';

  User(this.id, this.name, this.email, this.avatar);

  factory User.createUser(Map<String, dynamic> obj) {
    return User(
        obj['id'].toString(),
        obj['first_name'] + ' ' + obj['last_name'],
        obj['email'],
        obj['avatar']);
  }

  static Future<User> connectToAPI() async {
    var userUrl = Uri.parse(url + (random.nextInt(10) + 1).toString());
    print(userUrl.toString());
    var userData;

    try {
      var res = await http.get(userUrl);
      print(res);
      var objJson = jsonDecode(res.body);
      userData = (objJson as Map<String, dynamic>)['data'];
    } catch (error) {
      print(error);
    }

    return User.createUser(userData);
    //     var client = http.Client();
    // try {
    //   var response = await client.post(
    //       Uri.https('example.com', 'whatsit/create'),
    //       body: {'name': 'doodle', 'color': 'blue'});
    //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    //   var uri = Uri.parse(decodedResponse['uri'] as String);
    //   print(await client.get(uri));
    // } finally {
    //   client.close();
    // }
  }
}
