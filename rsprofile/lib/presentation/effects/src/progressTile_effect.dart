// ProgressTile___________________________________
import 'package:flutter/material.dart';

class ProgressTile extends StatelessWidget {
  final String title, caption;
  final double width;
  final Widget? leading;
  final double percentage;
  final List<Color>? barColor;
  final Curve curve;

  ProgressTile(
      {Key? key,
      required this.title,
      required this.caption,
      this.width = 350,
      this.barColor,
      this.leading,
      this.curve = Curves.linearToEaseOut,
      required this.percentage})
      : super(key: key) {
    if (barColor != null && percentage > 80) {
      barColor![barColor!.length - 1] = Colors.red;
    }
  }

  @override
  Widget build(_) => SizedBox(
        width: width,
        child: ListTile(
          leading: leading,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    style: Theme.of(_).textTheme.titleLarge,
                    text: title + ' ',
                    children: [
                      TextSpan(
                        text: caption,
                        style: Theme.of(_).textTheme.bodySmall,
                      )
                    ]),
              ),
              Text(
                percentage.toStringAsFixed(0) + '%',
                style: Theme.of(_).textTheme.titleMedium!.copyWith(
                    color: percentage > 80 ? Colors.red : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Stack(
              children: [
                Container(
                  height: 12,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal)
                      ]),
                ),
                AnimatedContainer(
                  height: 12,
                  width: percentage / 100 * 350,
                  curve: curve,
                  duration: const Duration(milliseconds: 1000),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: barColor ??
                              [
                                Colors.deepPurple,
                                percentage > 80 ? Colors.red : Colors.pinkAccent
                              ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                )
              ],
            ),
          ),
        ),
      );
}
