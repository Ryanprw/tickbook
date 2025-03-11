import 'package:flutter/material.dart';
import 'package:tickbook/domain/entities/user.dart';

class MainPage extends StatelessWidget {
  final User user;

  const MainPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), actions: const []),
      body: Center(child: Text(user.toString())),
    );
  }
}
