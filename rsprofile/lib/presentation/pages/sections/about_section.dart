import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsprofile/logics/blocs/repo_cubit.dart';
import 'package:rsprofile/presentation/widgets/help_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bodyText = Theme.of(context).textTheme.bodyLarge;
    var profile = (context.read<RepoCubit>().state as RepoFinish).profile;
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(alignment: Alignment.center, children: [
          Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
            SizedBox(
              width: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HelpWidgets.titleWidget(01, 'About', context),
                  const SizedBox(height: 16),
                  Text(
                    profile.about,
                    style: bodyText,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(100.0),
              child: ProfileImage(
                size: Size(300, 300),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(300 / 2),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
            )
          ])
        ]));
  }
}

class ProfileImage extends StatefulWidget {
  final BorderRadiusGeometry borderRadius;
  final Size size;

  const ProfileImage({Key? key, required this.borderRadius, required this.size}) : super(key: key);

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  bool _ondrag = false;

  @override
  Widget build(BuildContext context) {
    String image = (context.read<RepoCubit>().state as RepoFinish).profile.image;
    return MouseRegion(
      onEnter: (_) => setState(() => _ondrag = true),
      onExit: (_) => setState(() => _ondrag = false),
      child: Stack(
        children: [
          AnimatedSlide(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInCubic,
            offset: Offset(_ondrag ? 0.05 : 0, _ondrag ? 0.05 : 0),
            child: Container(
                width: widget.size.width + 3,
                height: widget.size.height + 3,
                decoration: BoxDecoration(
                    borderRadius: widget.borderRadius,
                    boxShadow: [
                      if (_ondrag)
                        BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 250, spreadRadius: -50)
                    ],
                    border: Border.all(width: 5, color: Theme.of(context).primaryColor))),
          ),
          AnimatedSlide(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInCubic,
            offset: Offset(_ondrag ? -0.05 : 0, _ondrag ? -0.05 : 0),
            child: Container(
                width: widget.size.width,
                height: widget.size.height,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: widget.borderRadius,
                  boxShadow: [
                    if (_ondrag)
                      BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 250, spreadRadius: -5)
                  ],
                ),
                child: Image.network(image)),
          ),
        ],
      ),
    );
  }
}
