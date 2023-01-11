import 'package:daybook/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import 'navigation_tile.dart';

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
              NavigationTile(
                icon: Icons.workspace_premium_rounded,
                title: 'Buy Premium',
                link: RegistrationScreen.route,
              ),
              NavigationTile(
                icon: Icons.palette_rounded,
                title: 'App Theme',
                link: RegistrationScreen.route,
              ),
              NavigationTile(
                icon: Icons.edit_rounded,
                title: 'Edit Profile',
                link: RegistrationScreen.route,
              ),
              NavigationTile(
                icon: Icons.notifications_rounded,
                title: 'Notifications',
                link: RegistrationScreen.route,
              ),
              NavigationTile(
                icon: Icons.lock_rounded,
                title: 'Diary Lock',
                link: RegistrationScreen.route,
              ),
              NavigationTile(
                icon: Icons.share_rounded,
                title: 'Share',
                link: RegistrationScreen.route,
              ),
              NavigationTile(
                icon: Icons.logout_rounded,
                title: 'Log Out',
                link: RegistrationScreen.route,
              ),
            ],
          ),
        ),
      ),
    );
  }
}