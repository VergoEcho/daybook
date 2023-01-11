import 'package:flutter/material.dart';

class DayTile extends StatelessWidget {
  const DayTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 48,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3 August',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Text(
                      'I have learned that...',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(
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
          const SizedBox(height: 8,),
          Text(
            'This semester was the first time that I have kept a daybook. I have heard about the concept of a daybook previously',
            style:
            Theme.of(context).textTheme.bodyText2?.copyWith(
              color: const Color(0xff0f140E),
            ),
          )
        ],
      ),
    );
  }
}