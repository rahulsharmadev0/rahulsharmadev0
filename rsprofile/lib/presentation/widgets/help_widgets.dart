import 'package:flutter/material.dart';

abstract class HelpWidgets {
  static titleWidget(int num, String title, context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  text: '$num. ',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                  children: [
                TextSpan(
                    text: title, style: Theme.of(context).textTheme.titleLarge)
              ])),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 0.5,
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
        ],
      );
}
