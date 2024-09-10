// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ParticalEffect extends StatefulWidget {
  const ParticalEffect({super.key});

  @override
  State<ParticalEffect> createState() => _ParticalEffectState();
}

class _ParticalEffectState extends State<ParticalEffect> {
  late List<Partical> particalList =
      List.generate(50, (index) => Partical(MediaQuery.of(context).size));
  late Timer timer;

  @override
  void initState() {

    const duration = Duration(milliseconds: 1000 ~/ 60);
    timer = Timer.periodic(duration, (timer) {
      for (var partical in particalList) {
        setState(() {
          if (partical.offset.dx > MediaQuery.of(context).size.width) {
            partical.offset = Offset(0, partical.offset.dy);
          } else if (partical.offset.dx < 0)
            partical.offset =
                Offset(MediaQuery.of(context).size.width, partical.offset.dy);
          else if (partical.offset.dy > MediaQuery.of(context).size.height)
            partical.offset = Offset(partical.dx, 0);
          else if (partical.offset.dy < 0)
            partical.offset =
                Offset(partical.dx, MediaQuery.of(context).size.height);
          else
            partical.offset += Offset(partical.dx, partical.dy);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: _ParticalPaint(particalList),
        child: Container());
  }
}

class _ParticalPaint extends CustomPainter {
  final List<Partical> particalList;

  _ParticalPaint(this.particalList);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    for (var p in particalList) {
      canvas.drawCircle(
          p.offset,
          p.size,
          paint
            ..style = PaintingStyle.fill
            ..color = p.color);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Partical {
  Partical(this.displaySize) {
    color = Randomly.randomColor;
    size = Randomly.range(2, 10);
    var x = Randomly.range(0, displaySize.width);
    var y = Randomly.range(0, displaySize.height);
    offset = Offset(x, y);
    dx = Randomly.range(-1, 1);
    dy = Randomly.range(-1, 1);
  }

  late Color color;
  Size displaySize;
  late Offset offset;
  late double size;
  late double dx, dy;
}

abstract class Randomly {
  static double range(double min, double max) =>
      Random().nextDouble() * (max - min) + min;

  static Color get randomColor {
    // Pick a random number in the range [0.0, 1.0)
    double randomDouble = Random().nextDouble();
    return Color((randomDouble * 0xFFFFFF).toInt()).withOpacity(range(0.2, 1.0));
  }
}
