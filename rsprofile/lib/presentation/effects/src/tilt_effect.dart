// TiltEffect___________________________________
import 'package:flutter/material.dart';

class TiltEffect extends StatefulWidget {
  final Size size;
  final Widget child;
  final bool innerScale, outerScale;
  final BorderRadiusGeometry? borderRadius;

  const TiltEffect(
      {Key? key,
      required this.size,
      required this.child,
      this.borderRadius,
      this.innerScale = true,
      this.outerScale = true})
      : super(key: key);

  @override
  _TiltEffectState createState() => _TiltEffectState();
}

class _TiltEffectState extends State<TiltEffect>
    with SingleTickerProviderStateMixin {
  Offset localPosition = Offset.zero;
  bool defaultPosition = true;

  @override
  Widget build(BuildContext context) {
    double percentageX = (localPosition.dx / widget.size.width) * 100;
    double percentageY = (localPosition.dy / widget.size.height) * 100;
    return MouseRegion(
      onExit: (value) => setState(() => defaultPosition = true),
      onHover: (details) {
        setState(() {
          defaultPosition = false;
          localPosition = details.localPosition;
        });
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(
              defaultPosition ? 0 : (0.3 * (percentageY / 50) + -0.3) * 0.5)
          ..rotateY(
              defaultPosition ? 0 : (-0.3 * (percentageX / 50) + 0.3) * 0.5),
        alignment: FractionalOffset.center,
        child: Container(
          constraints: BoxConstraints.loose(widget.size),
          decoration: BoxDecoration(borderRadius: widget.borderRadius),
          clipBehavior: Clip.hardEdge,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: widget.outerScale && defaultPosition ? 1.05 : 1,
            child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                scale: widget.innerScale && defaultPosition ? 1 : 1.1,
                child: widget.child),
          ),
        ),
      ),
    );
  }
}
