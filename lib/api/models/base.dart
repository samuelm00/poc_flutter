class BaseFeedModel {
  final String title;
  final String body;

  BaseFeedModel({
    required this.title,
    required this.body,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseFeedModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          body == other.body;

  factory BaseFeedModel.fromJson(Map<String, dynamic> json) {
    return BaseFeedModel(
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
