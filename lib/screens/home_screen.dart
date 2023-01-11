import 'package:daybook/components/day_tile.dart';
import 'package:daybook/components/UI/navigation_drawer.dart';
import 'package:flutter/material.dart';

import '../components/UI/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32, right: 8),
        child: Builder(builder: (context) {
          return FloatingActionButton(
            child: const Icon(Icons.edit_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
      ),
      drawer: const NavigationDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: ShaderMask(
                blendMode: BlendMode.softLight,
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0.0,
                        0.05,
                      ],
                      colors: [
                        // Colors.black,
                        Theme.of(context).backgroundColor,
                        Colors.white.withOpacity(0),
                      ]).createShader(rect);
                },
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Welcome back, Jane!',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Text('How are you feeling today ?',
                                  style: Theme.of(context).textTheme.headline3),
                            ],
                          ),
                        ),
                        Image.asset(
                          height: 64,
                          width: 70,
                          'images/mini_avatar.png',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 128,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'images/cats/fat_cat.png',
                            width: 88,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Image.asset(
                              'images/cats/write_cat.png',
                              width: 112,
                            ),
                          ),
                          Image.asset(
                            'images/cats/love_cat.png',
                            width: 88,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(),
                    Text(
                      'Yesterday',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                    const DayTile(),
                    const DayTile(),
                    const DayTile(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


