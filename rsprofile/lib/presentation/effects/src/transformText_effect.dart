import 'package:flutter/material.dart';

// TransformEffect____________________________________________________
class TransformTextEffect extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final String text1;
  final String text2;
  final TextStyle textStyle1;
  final TextStyle textStyle2;
  final bool scaling;
  final Offset offsetXY;
  final Duration duration;
  final Alignment scaleAlignment;
  final double scaleValue;
  final Curve curve;
  final VoidCallback? onTap;

  const TransformTextEffect(
      {Key? key,
      this.offsetXY = const Offset(0, -0.1),
      this.padding = const EdgeInsets.symmetric(horizontal: 16),
      this.duration = const Duration(milliseconds: 300),
      this.scaleValue = 1.1,
      this.scaleAlignment = Alignment.center,
      this.curve = Curves.linear,
      this.onTap,
      required this.text1,
      required this.text2,
      required this.textStyle1,
      required this.textStyle2,
      this.scaling = true})
      : super(key: key);

  @override
  _TransformTextEffectState createState() => _TransformTextEffectState();
}

class _TransformTextEffectState extends State<TransformTextEffect> {
  bool isTranslate = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      curve: widget.curve,
      offset: isTranslate ? widget.offsetXY : Offset.zero,
      duration: widget.duration,
      child: widget.scaling
          ? AnimatedScale(
              curve: widget.curve,
              duration: widget.duration,
              scale: isTranslate ? widget.scaleValue : 1,
              alignment: widget.scaleAlignment,
              child: buildMouseRegion(),
            )
          : buildMouseRegion(),
    );
  }

  MouseRegion buildMouseRegion() {
    return MouseRegion(
        onEnter: (_) => setState(() => isTranslate = true),
        onExit: (_) => setState(() => isTranslate = false),
        child: GestureDetector(
            onTap: widget.onTap,
            child: Padding(
              padding: widget.padding,
              child: RichText(
                  text: TextSpan(
                      text: widget.text1,
                      style: widget.textStyle1,
                      children: [
                    TextSpan(
                        text: widget.text2,
                        style:
                            isTranslate ? widget.textStyle1 : widget.textStyle2)
                  ])),
            )));
  }
}
