import 'package:flutter/material.dart';

import 'custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0.0,
                        0.01
                      ],
                      colors: [
                        // Colors.black,
                        Colors.white.withOpacity(0),
                        Theme.of(context).backgroundColor,
                      ]).createShader(rect);
                },
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    Container(height: 24),
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
                      height: 1000,
                    )
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

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 56),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xfffff5e0),
                      radius: 80,
                      backgroundImage: AssetImage('images/avatar.png'),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () => Scaffold.of(context).closeDrawer(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Jane Cooper',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              const NavigationTile(
                icon: Icons.workspace_premium_rounded,
                title: 'Buy Premium',
                link: '/register',
              ),
              const NavigationTile(
                icon: Icons.palette_rounded,
                title: 'App Theme',
                link: '/register',
              ),
              const NavigationTile(
                icon: Icons.edit_rounded,
                title: 'Edit Profile',
                link: '/register',
              ),
              const NavigationTile(
                icon: Icons.notifications_rounded,
                title: 'Notifications',
                link: '/register',
              ),
              const NavigationTile(
                icon: Icons.lock_rounded,
                title: 'Diary Lock',
                link: '/register',
              ),
              const NavigationTile(
                icon: Icons.share_rounded,
                title: 'Share',
                link: '/register',
              ),
              const NavigationTile(
                icon: Icons.logout_rounded,
                title: 'Log Out',
                link: '/register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationTile extends StatelessWidget {
  const NavigationTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.link,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          onTap: () {},
          minLeadingWidth: 16,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: const Color(0xfffffdfa),
                borderRadius: BorderRadius.circular(9)),
            child: Icon(
              icon,
              color: const Color(0xff91c789),
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          trailing: const Icon(
            Icons.navigate_next_rounded,
            size: 32,
          ),
        )
      ],
    );
  }
}
