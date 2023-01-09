import 'package:daybook/theme.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const Daybook());
}

class Daybook extends StatelessWidget {
  const Daybook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daybook',
      theme: appTheme,
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
      },
    );
  }
}



