import 'package:flutter/material.dart';
import 'package:rsprofile/const/globle_variable.dart';
import 'package:rsprofile/presentation/pages/BlocBuilderPassOn.dart';
import 'package:rsprofile/presentation/pages/resuma_page.dart';
import 'sections/about_section.dart';
import 'sections/contect_section.dart';
import 'sections/intro_section.dart';
import 'sections/projects_section.dart';
import '../effects/effects.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final PageController scrollController = PageController();

  List<Map<String, dynamic>> get actionButtons => [
        {
          'title': 'About',
          'onTap': () => scrollController.animateToPage(1,
              curve: Curves.bounceInOut, duration: const Duration(milliseconds: 300))
        },
        {
          'title': 'Projects',
          'onTap': () => scrollController.animateToPage(2,
              curve: Curves.bounceInOut, duration: const Duration(milliseconds: 300))
        },
        {
          'title': 'Contact',
          'onTap': () => scrollController.animateToPage(3,
              curve: Curves.bounceInOut, duration: const Duration(milliseconds: 300))
        }
      ];

  List<Widget> get widgetItems => const [IntroSection(), AboutSection(), ProjectsSection(), ContectSection()];

  @override
  Widget build(BuildContext context) {
    var mono = Theme.of(context).textTheme.labelLarge!;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            Row(
              children: [
                for (int i = 0; i < actionButtons.length; i++)
                  TransformTextEffect(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    duration: const Duration(milliseconds: 150),
                    onTap: actionButtons[i]['onTap'] as VoidCallback,
                    text1: '0${i + 1}. ',
                    text2: actionButtons[i]['title'],
                    textStyle1: mono.copyWith(color: Theme.of(context).primaryColor),
                    textStyle2: mono,
                  ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromHeight(38)),
                    onPressed: () => showDialog(context: context, builder: (_) => const ResumeWidget()),
                    child: const Text('Resume')),
              ],
            ),
            const SizedBox(width: 32)
          ],
        ),
        body: Stack(
          children: [
            const ParticalEffect(),
            BlocBuilderPassOn(
              child: (state) => ListView.builder(
                  itemCount: widgetItems.length,
                  controller: scrollController,
                  itemBuilder: (ctx, index) => widgetItems[index]),
            ),
            Positioned(
                bottom: 0,
                left: 32,
                child: Column(
                  children: [
                    TransformSvgEffect('github',
                        offsetXY: const Offset(0.2, 0), onTap: () => launchUrl(MyProfile.github().uri)),
                    TransformSvgEffect('figma',
                        offsetXY: const Offset(0.2, 0), onTap: () => launchUrl(MyProfile.figma().uri)),
                    TransformSvgEffect(
                      'insta',
                      offsetXY: const Offset(0.2, 0),
                      onTap: () => launchUrl(MyProfile.instagram().uri),
                    ),
                    TransformSvgEffect(
                      'linkedin',
                      offsetXY: const Offset(0.2, 0),
                      onTap: () => launchUrl(MyProfile.linkedin().uri),
                    ),
                    TransformSvgEffect(
                      'youtube',
                      offsetXY: const Offset(0.2, 0),
                      onTap: () => launchUrl(MyProfile.youtube().uri),
                    ),
                    Container(
                      height: 80,
                      width: 2,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  ],
                )),
            Positioned(
                bottom: 0,
                right: 32,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => launchUrl(MyProfile.email().uri),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            MyProfile.email().value,
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 2,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  ],
                )),
          ],
        ));
  }
}
