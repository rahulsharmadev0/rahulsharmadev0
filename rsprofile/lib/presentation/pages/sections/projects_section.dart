import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsprofile/presentation/widgets/help_widgets.dart';
import 'package:rsprofile/presentation/widgets/productDisplay_widget.dart';
import '../../../logics/blocs/repo_cubit.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    int length = (context.read<RepoCubit>().state as RepoFinish).projects.length;
    Stream.periodic(const Duration(seconds: 5), (_) {
      currentIndex++;
      if (currentIndex < 0) {
        currentIndex == length;
      } else if (currentIndex > length) currentIndex = 0;
      controller.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
    }).listen((event) {});
  }

  @override
  Widget build(BuildContext context) {
    var projects = (context.read<RepoCubit>().state as RepoFinish).projects;
    var textTheme = Theme.of(context).textTheme;

    return Center(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HelpWidgets.titleWidget(02, 'Some Things I’ve Built', context),
          const SizedBox(height: 32),
          SizedBox(
              height: 500,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: projects.length,
                onPageChanged: (value) => setState(() {
                  currentIndex = value;
                }),
                controller: controller,
                itemBuilder: (build, i) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 500,
                      child: ProjectDisplayWidget(project: projects[i]));
                },
              )),
        ],
      ),
    ));
  }
}
