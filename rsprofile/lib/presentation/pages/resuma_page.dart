// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsprofile/logics/blocs/repo_cubit.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:rsprofile/const/globle_variable.dart';

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoCubit, RepoState>(
      builder: (context, state) {
        return state is RepoFinish ? const IFrameWidget() : const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class IFrameWidget extends StatefulWidget {
  const IFrameWidget({super.key});

  @override
  State<IFrameWidget> createState() => _IFrameWidgetState();
}

class _IFrameWidgetState extends State<IFrameWidget> with AutomaticKeepAliveClientMixin {
  final String id = 'iframeElement';

  @override
  void initState() {
    super.initState();

    var htmlDocument = html.IFrameElement()
      ..src = MyProfile.resume().value
      ..allowFullscreen = true
      ..height = '100%'
      ..width = '100%'
      ..style
      ..style.border = 'none'
      ..style.overflow = "hidden";

    ui.platformViewRegistry.registerViewFactory(
      id,
      (int _) => htmlDocument,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: SizedBox(
        width: 820,
        child: HtmlElementView(
          viewType: id,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
