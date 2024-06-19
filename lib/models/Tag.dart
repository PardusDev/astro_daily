class Tag {
  final int id;
  final String name;
  final String description;
  final String assetPath;
  const Tag({required this.id, required this.name, required this.description, required this.assetPath});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      assetPath: json["assetPath"]
    );
  }

  static List<Tag> fromJsonList(List<dynamic> list) {
    return list.map((item) => Tag.fromJson(item)).toList();
  }
}