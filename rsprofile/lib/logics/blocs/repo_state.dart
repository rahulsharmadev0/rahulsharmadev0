part of 'repo_cubit.dart';

@immutable
abstract class RepoState {}

class RepoLoading extends RepoState {}

class RepoError extends RepoState {}

class RepoFinish extends RepoState {
  final Profile profile;
  final List<Project> projects;
  final List<WorkExperience> experiencelist;

  RepoFinish(
      {required this.profile,
      required this.projects,
      required this.experiencelist});
}
