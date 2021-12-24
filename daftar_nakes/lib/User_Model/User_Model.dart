import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

// import 'dart:math';
//http://127.0.0.1:8000/daftar_nakes/api
//https://reqres.in/api/users?page=2
//https://reqres.in/api/users/2
String url = 'http://10.0.2.2:8000/daftar_nakes/api';

class User {
  static var users = [];
  String rs;
  String name = '';
  String umur = '';
  String pendidikan = '';

  User(this.rs, this.name, this.umur, this.pendidikan);

  String toString() {
    return this.name + " " + this.umur + " " + this.rs + " " + this.pendidikan;
  }

  factory User.createUser(Map<String, dynamic> obj) {
    return User(obj["rumah_sakit"], obj['nama'], obj['umur'].toString(),
        obj['pendidikan']);
  }

  static Future<List<User>?> connectToAPI() async {
    var userUrl = Uri.parse(url);
    var request = http.Client();
    print(userUrl);
    List<User> list = [];
    try {
      Map userData;
      final res = await request.get(userUrl);
      var objJson = jsonDecode(res.body);
      request.close();
      userData = (objJson as Map<String, dynamic>);
      for (var item in userData.values) {
        list.add(User.createUser(item));
      }
      return list;
    } catch (error) {
      request.close();
      print(error);
      return null;
    }
  }
}