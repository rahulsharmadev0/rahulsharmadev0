// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class TransformSvgEffect extends StatefulWidget {
  final String file;
  final EdgeInsetsGeometry padding;
  final Offset offsetXY;
  final Duration duration;
  final Alignment scaleAlignment;
  final double scaleValue;
  final Curve curve;
  final VoidCallback? onTap;

  const TransformSvgEffect(this.file,
      {super.key,
      this.offsetXY = const Offset(0, -0.1),
      this.padding = const EdgeInsets.symmetric(horizontal: 16),
      this.duration = const Duration(milliseconds: 300),
      this.scaleValue = 1.1,
      this.scaleAlignment = Alignment.center,
      this.curve = Curves.linear,
      this.onTap});

  @override
  _TransformSvgEffectState createState() => _TransformSvgEffectState();
}

class _TransformSvgEffectState extends State<TransformSvgEffect> {
  bool ondrag = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) {
        setState(() => ondrag = true);
      },
      onExit: (_) {
        setState(() => ondrag = false);
      },
      child: AnimatedSlide(
          curve: widget.curve,
          offset: ondrag ? widget.offsetXY : Offset.zero,
          duration: widget.duration,
          child: AnimatedScale(
            curve: widget.curve,
            duration: widget.duration,
            scale: ondrag ? widget.scaleValue : 1,
            alignment: widget.scaleAlignment,
            child: IconButton(
              onPressed: widget.onTap,
              padding: const EdgeInsets.all(16),
              icon: SvgPicture.asset(
                'assets/icons/${widget.file}.svg',
                width: 32,
                colorFilter: ColorFilter.mode(
                  ondrag ? theme.primaryColor : theme.colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          )),
    );
  }
}
