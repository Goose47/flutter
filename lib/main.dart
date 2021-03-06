import 'package:flutter/material.dart';
import './pages/index.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        '/game': (context) => const GamePage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
