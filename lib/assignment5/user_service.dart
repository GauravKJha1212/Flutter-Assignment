import 'dart:convert';

import 'package:http/http.dart' as http;

import 'user_model.dart';

/// Service responsible for fetching user data from the dummyjson API.
class UserService {
  static const _baseUrl = 'https://dummyjson.com';

  /// Returns a list of [User]s fetched from the `/users` endpoint.
  Future<List<User>> fetchUsers() async {
    final uri = Uri.parse('$_baseUrl/users');
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to load users');
    }
    final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> usersJson = data['users'] as List<dynamic>;
    return usersJson.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
  }
}

