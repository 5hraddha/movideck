class Genre {
  final int? id;
  final String? name;

  Genre({required this.id, required this.name});

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  @override
  String toString() {
    return 'name: $name';
  }
}
