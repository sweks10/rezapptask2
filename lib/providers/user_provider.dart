import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// user_provider.dart
class UserProvider with ChangeNotifier {
  String userId = '';
  int coins = 0;

  void setUserId(String id) {
    userId = id;
    notifyListeners();
  }

  void setCoins(int newCoins) {
    coins = newCoins;
    notifyListeners();
  }

  Future<void> fetchCoinsFromServer() async {
    if (userId.isEmpty) return;
    final response = await http.get(
      Uri.parse('http://192.168.29.134:5000/users/$userId'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      coins = data['coins'];
      notifyListeners();
    }
  }
}
