import 'dart:convert' show json;

class WorkExperience {
  WorkExperience({
    required this.logoSvg,
    required this.progress,
    required this.title,
  });

  final String logoSvg;
  final int progress;
  final String title;

  factory WorkExperience.fromRawJson(String str) =>
      WorkExperience.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      WorkExperience(
        logoSvg: json["logoSvg"],
        progress: json["progress"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "logoSvg": logoSvg,
        "progress": progress,
        "title": title,
      };
}
