import 'package:flutter/material.dart';

import 'pages/home.dart';

class CopyAnywhere extends StatelessWidget {
  const CopyAnywhere({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Copy AnyWhere',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
