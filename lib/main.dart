import 'package:flutter/material.dart';
import 'package:login_register_ui/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Register Screen UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.orange,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              child: const Text("Login"),
            ),
            MaterialButton(
              color: Colors.orange,
              onPressed: () {},
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
