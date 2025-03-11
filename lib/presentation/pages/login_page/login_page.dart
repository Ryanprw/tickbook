import 'package:flutter/material.dart';
import 'package:tickbook/data/firebase/firebase_authentication.dart';
import 'package:tickbook/data/firebase/firebase_user_repositories.dart';
import 'package:tickbook/domain/usecases/login/login.dart';
import 'package:tickbook/presentation/pages/main_page/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: SingleChildScrollView(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              Login login = Login(
                authentication: FirebaseAuthentication(),
                userRepositories: FirebaseUserRepositories(),
              );

              final result = await login(
                LoginParams(email: 'email', password: 'password'),
              );

              if (result.isSuccess) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MainPage(user: result.resultValue!),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result.errorMessage ?? "Login gagal")),
                );
              }
            },
            child: const Text('Login'),
          ),
        ),
      ),
    );
  }
}
