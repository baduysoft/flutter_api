import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  String id;
  String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      name: object['first_name'] + " " + object['last_name'],
    );
  }

  static Future<User> connectToApi(String id) async {
    String apiUrl = "https://reqres.in/api/users/$id";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    return User.createUser(userData);
  }
}
