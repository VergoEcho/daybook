import 'package:flutter/material.dart';

class NotesNoteTile extends StatelessWidget {
  const NotesNoteTile({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 48,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3 August',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    Text(
                      title.length > 30 ? '${title.substring(0, 29)}...' : title,
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: const Color(0xff0f140E),
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'images/post_image.png',
                height: 48,
                width: 48,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: const Color(0xff0f140E),
                ),
          )
        ],
      ),
    );
  }
}
