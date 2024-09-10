class MyProfile {
  final String value;
  const MyProfile._(this.value);

  factory MyProfile.resume() => const MyProfile._(
      'https://docs.google.com/document/d/e/2PACX-1vQy8xcRYbMlNKUETMWx89PseYFepcebwynoz3mUUhotC-7258_LH8b1rijHJakSU72GYkV9dWuYXklB/pub?embedded=true');

  factory MyProfile.github() => const MyProfile._('https://github.com/rahulsharmadev-community');
  factory MyProfile.figma() => const MyProfile._('https://www.figma.com/@rahulsharmadev');
  factory MyProfile.instagram() => const MyProfile._('https://www.instagram.com/rahulsharmadev');
  factory MyProfile.linkedin() => const MyProfile._('https://in.linkedin.com/in/rahulsharmadev');
  factory MyProfile.youtube() =>
      const MyProfile._('https://www.youtube.com/channel/UCkwuhHD60GHZl5Mlnf-SWzA');

  factory MyProfile.email() => const MyProfile._('rahulsharmadev.talk@gmail.com');

  Uri get uri {
    if (this == MyProfile.email()) {
      return Uri(
        scheme: 'mailto',
        path: MyProfile.email().value,
        query: _encodeQueryParameters(<String, String>{'subject': 'Hello Rahul!'}),
      );
    }
    return Uri.parse(value);
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  operator ==(Object other) {
    return other is MyProfile && other.value == value;
  }

  @override
  int get hashCode => uri.hashCode;
}
