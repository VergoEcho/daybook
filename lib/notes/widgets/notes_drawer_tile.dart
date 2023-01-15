import 'package:flutter/material.dart';

class NotesDrawerTile extends StatelessWidget {
  const NotesDrawerTile({
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
          // onTap: () => Navigator.pushNamed(context, link),
          onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
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