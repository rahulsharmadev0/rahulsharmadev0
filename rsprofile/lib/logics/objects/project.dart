import 'dart:convert' show json;

class Project {
  Project({
    required this.about,
    required this.externalLink,
    required this.githubRepo,
    required this.image,
    required this.name,
  });

  final String about;
  final String externalLink;
  final String githubRepo;
  final String image;
  final String name;

  factory Project.fromRawJson(String str) => Project.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        about: json["about"],
        externalLink: json["externalLink"],
        githubRepo: json["githubRepo"],
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "externalLink": externalLink,
        "githubRepo": githubRepo,
        "image": image,
        "name": name,
      };
}
