import 'package:flutter/material.dart';
import 'package:hello_grpc_web/widgets/welcome_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScaffold(),
    );
  }
}
