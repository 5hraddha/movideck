class Cast {
  final String name;
  final String original_name;
  final String character;
  final num popularity;
  final String? profile_path;

  Cast({
    required this.name,
    required this.original_name,
    required this.character,
    required this.popularity,
    required this.profile_path,
  });

  Cast.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        original_name = json['original_name'],
        character = json['character'],
        popularity = json['popularity'],
        profile_path = json['profile_path'];

  @override
  String toString() {
    return 'name: $name, character: $character';
  }
}
