import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsprofile/logics/blocs/repo_cubit.dart';

class BlocBuilderPassOn extends StatelessWidget {
  final Widget Function(RepoFinish) child;

  const BlocBuilderPassOn({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoCubit, RepoState>(builder: (context, state) {
      if (state is RepoFinish) {
        return child(state);
      } else if (state is RepoError) {
        return Center(child: Text('SomeThing Wrong', style: Theme.of(context).textTheme.displayLarge));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
