import 'dart:convert' show json;

class Profile {
  Profile({
    required this.about,
    required this.image,
    required this.name,
    required this.resume,
    required this.onelineIntro,
    required this.recently_technologies,
    required this.shotBrief,
  });

  final String about;
  final String image;
  final String name;
  final String resume;
  final String onelineIntro;
  final List<String> recently_technologies;
  final String shotBrief;

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        about: json["about"],
        image: json["image"],
        name: json["name"],
        resume: json['resume'],
        onelineIntro: json["onelineIntro"],
        recently_technologies:
            List<String>.from(json["recently_technologies:"].map((x) => x)),
        shotBrief: json["shotBrief"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "image": image,
        "name": name,
        "resume": resume,
        "onelineIntro": onelineIntro,
        "recently_technologies:":
            List<dynamic>.from(recently_technologies.map((x) => x)),
        "shotBrief": shotBrief,
      };
}
