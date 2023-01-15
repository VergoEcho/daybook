import 'package:daybook/authentication/views/authentication_page.dart';
import 'package:flutter/material.dart';

import 'package:daybook/notes/widgets/notes_drawer_tile.dart';

class NotesDrawer extends StatelessWidget {
  const NotesDrawer({
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
              NotesDrawerTile(
                icon: Icons.workspace_premium_rounded,
                title: 'Buy Premium',
                link: AuthenticationPage.route,
              ),
              NotesDrawerTile(
                icon: Icons.palette_rounded,
                title: 'App Theme',
                link: AuthenticationPage.route,
              ),
              NotesDrawerTile(
                icon: Icons.edit_rounded,
                title: 'Edit Profile',
                link: AuthenticationPage.route,
              ),
              NotesDrawerTile(
                icon: Icons.notifications_rounded,
                title: 'Notifications',
                link: AuthenticationPage.route,
              ),
              NotesDrawerTile(
                icon: Icons.lock_rounded,
                title: 'Diary Lock',
                link: AuthenticationPage.route,
              ),
              NotesDrawerTile(
                icon: Icons.share_rounded,
                title: 'Share',
                link: AuthenticationPage.route,
              ),
              NotesDrawerTile(
                icon: Icons.logout_rounded,
                title: 'Log Out',
                link: AuthenticationPage.route,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
