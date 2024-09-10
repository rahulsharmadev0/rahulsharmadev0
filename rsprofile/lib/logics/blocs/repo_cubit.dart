import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rsprofile/logics/api_credentials.dart';
import 'package:rsprofile/logics/objects/profile.dart';
import 'package:rsprofile/logics/objects/project.dart';
import 'package:rsprofile/logics/objects/work_experience.dart';

part 'repo_state.dart';

class RepoCubit extends Cubit<RepoState> {
  RepoCubit() : super(RepoLoading()) {
    fetchAndEmit();
  }

  fetchAndEmit() async {
    var profilejson = await _httpRequest(ApiCredentials.profile + '.json');
    var projectsjson = await _httpRequest(ApiCredentials.projects + '.json');
    var workjson = await _httpRequest(ApiCredentials.workExperience + '.json');
    List<Project> _projects = [];
    List<WorkExperience> _experiencelist = [];
    projectsjson!
        .forEach((key, value) => _projects.add(Project.fromJson(value)));
    workjson!.forEach(
        (key, value) => _experiencelist.add(WorkExperience.fromJson(value)));
    emit(RepoFinish(
        profile: Profile.fromJson(profilejson!),
        projects: _projects,
        experiencelist: _experiencelist));
  }

  Future<Map<String, dynamic>?> _httpRequest(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      return json.decode(response.body) as Map<String, dynamic>;
    } catch (e) {
      emit(RepoError());
    }
    return null;
  }
}
