import 'package:daybook/authentication/views/authentication_page.dart';
import 'package:daybook/notes/views/notes_page.dart';
import 'package:daybook/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daybook/notes/bloc/note_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NoteBloc()),
      ],
      child: MaterialApp(
        title: 'Daybook',
        theme: appTheme,
        initialRoute: AuthenticationPage.route,
        routes: {
          NotesPage.route: (context) => const NotesPage(),
          AuthenticationPage.route: (context) => const AuthenticationPage(),
        },
      ),
    );
  }
}