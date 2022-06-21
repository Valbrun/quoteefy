import 'package:flutter/material.dart';
import 'package:quoteefy/screens/home_page_screen.dart';

void main() {
  runApp(const Quoteefy());
}

class Quoteefy extends StatelessWidget {
  const Quoteefy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
