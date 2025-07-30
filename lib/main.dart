import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rezapp/home_screen.dart';
import 'package:rezapp/providers/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rez App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomeScreen(),
    );
  }
}
