class Tage_MODEL {
  final int? id;
  final String? name;
  final String? backgroundUrl;
  final String? imageUrl;
  final String? description;
  final int? tagePosts;

  Tage_MODEL(
      {this.id,
      this.name,
      this.backgroundUrl,
      this.imageUrl,
      this.description,
      this.tagePosts});

  factory Tage_MODEL.fromJson(Map<String, dynamic> data) {
    return Tage_MODEL(
        id: data["id"],
        name: data["name"],
        imageUrl: data["imageUrl"],
        backgroundUrl: data["backgroundUrl"],
        description: data["description"],
        tagePosts: data["tage_posts"]);
  }

  toThing(Map<String, dynamic> data) {
    return Tage_MODEL(
      id: data["id"] ?? 0,
      name: data["name"] ?? "",
      imageUrl: data["imageUrl"] ?? "",
      backgroundUrl: data["backgroundUrl"] ?? "",
      description: data["description"] ?? "",
      tagePosts: data["tage_posts"] ?? 0,
    );
  }
}
