// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:rsprofile/logics/objects/project.dart';
import 'package:rsprofile/presentation/effects/src/transformSvg_effect.dart';

class ProjectDisplayWidget extends StatelessWidget {
  final Project project;

  const ProjectDisplayWidget({super.key, required this.project});

  buildSvg(file, context) =>
      SvgPicture.asset('assets/icons/$file.svg', width: 28, color: Theme.of(context).colorScheme.secondary);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 500,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                height: 500,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.hardEdge,
                child: AspectRatio(aspectRatio: 16 / 9, child: Image.network(project.image))),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Featured Project',
                    style: textTheme.labelLarge!.copyWith(color: Theme.of(context).primaryColor)),
                const SizedBox(height: 8),
                Text(
                  project.name,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: const EdgeInsets.all(16),
                  height: 150,
                  decoration: BoxDecoration(
                      color: const Color(0xff112240),
                      boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 5)],
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Text(
                    project.about,
                    textAlign: TextAlign.end,
                    style: textTheme.bodyLarge,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TransformSvgEffect(
                        'github',
                        onTap: () => launchUrl(Uri.parse(project.githubRepo)),
                      ),
                      const SizedBox(width: 24),
                      TransformSvgEffect(
                        'link',
                        onTap: () => launchUrl(Uri.parse(project.externalLink)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
