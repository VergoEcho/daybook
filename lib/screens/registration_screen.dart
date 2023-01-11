import 'package:daybook/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_cubit.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Image.asset('images/check_in.png'),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Daybook',
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Column(
                    children: [
                      Text(
                        'Create a free account',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: const Color(0xff0f140E),
                            ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Join Daybook for free. Create and share unlimited notes with your friends',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: const Color(0xff0f140E),
                              fontWeight: FontWeight.w700,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      const TextField(
                        // onChanged: () => context.read<UserCubit>.login,
                        decoration: InputDecoration(hintText: 'Name'),
                      ),
                      const TextField(
                        decoration: InputDecoration(hintText: 'Email Address'),
                      ),
                      const TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: false
                            ? null
                            : () {
                                Navigator.pushNamed(context, HomeScreen.route);
                              },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: const Color(0xff0f140E),
                                    ),
                          ),
                          BlocBuilder<UserCubit, UserState>(
                            builder: (context, UserState state) {
                              return TextButton(
                                onPressed: state is UserLoadInProgress
                                    ? null
                                    : () {
                                        if (state is UserInputInProgress) {
                                          context
                                              .read<UserCubit>()
                                              .login(state.name);
                                          Navigator.pushNamed(
                                              context, HomeScreen.route);
                                        }
                                      },
                                child: Text(
                                  'Sign In',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
