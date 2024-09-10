import 'package:flutter/material.dart';
import 'package:rsprofile/const/globle_variable.dart';
import 'package:url_launcher/url_launcher.dart';import '/presentation/pages/BlocBuilderPassOn.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    var displayText = Theme.of(context).textTheme.displayLarge;
    var bodyText = Theme.of(context).textTheme.bodyLarge;
    var mono = Theme.of(context).textTheme.labelLarge;
    return BlocBuilderPassOn(
      child: (state) {
        var profile = state.profile;
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                left: MediaQuery.of(context).size.width * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                      child: Text(
                        'Hi, my name is',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Theme.of(context).primaryColor, fontSize: 16),
                      ),
                    ),
                    RichText(
                        text: TextSpan(text: '${profile.name}\n', style: displayText!, children: [
                      TextSpan(text: profile.onelineIntro, style: displayText),
                    ])),
                    Container(
                      width: 600,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                      child: Text(profile.shotBrief, style: bodyText),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize: const Size.fromHeight(kToolbarHeight),
                          ),
                          onPressed: () => launchUrl(MyProfile.youtube().uri),
                          child: const Text('Check out my Tutorials!')),
                    ),
                  ],
                ),
              ),
            ]));
      },
    );
  }
}
