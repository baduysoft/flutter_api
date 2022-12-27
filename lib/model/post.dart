import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  String id, name, job, created;

  Post({
    required this.id,
    required this.name,
    required this.job,
    required this.created,
  });

  factory Post.createPost(Map<String, dynamic> object) {
    return Post(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
    );
  }

  static Future<Post> connectToApi(String name, String job) async {
    String apiUrl = "https://reqres.in/api/users";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {
        "name": name,
        "job": job,
      },
    );
    var jsonObject = json.decode(apiResult.body);

    return Post.createPost(jsonObject);
  }
}
