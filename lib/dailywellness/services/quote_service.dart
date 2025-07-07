import 'dart:convert';

import 'package:http/http.dart' as http;

class QuoteService {
  Future<String> fetchQuote() async {
    try {
      final response = await http.get(Uri.parse('https://favqs.com/api/qotd'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data['quote']['body'] as String;
      }
      throw Exception('Failed to load quote');
    } catch (_) {
      rethrow;
    }
  }
}
