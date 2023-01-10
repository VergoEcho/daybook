import 'package:daybook/screens/registration_screen.dart';
import 'package:daybook/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const Daybook());
}

class Daybook extends StatelessWidget {
  const Daybook({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Daybook',
      theme: appTheme,
      initialRoute: RegistrationScreen.route,
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
        RegistrationScreen.route: (context) => const RegistrationScreen(),
      },
    );
  }
}


