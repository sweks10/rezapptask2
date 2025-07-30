import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.29.134:5000';

  // Submit a review
  static Future<bool> submitReview({
    required String userId,
    required String productId,
    required String text,
    required int rating,
  }) async {
    final url = Uri.parse('$baseUrl/reviews');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "userId": userId,
        "productId": productId,
        "text": text,
        "rating": rating,
      }),
    );

    return response.statusCode == 200;
  }

  // Create user
  static Future<String?> createUser(String name) async {
    final url = Uri.parse('$baseUrl/users');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"name": name}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['_id'];
    }
    return null;
  }

  // Get user info (coins etc.)
  static Future<int?> getUserCoins(String userId) async {
    final url = Uri.parse('$baseUrl/users/$userId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['coins'];
    }
    return null;
  }
}
