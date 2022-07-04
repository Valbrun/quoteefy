import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteefy/providers/quote_provider.dart';
import 'package:quoteefy/screens/home_page_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuoteProvider(),
        )
      ],
      child: Quoteefy(),
    ),
  );
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
