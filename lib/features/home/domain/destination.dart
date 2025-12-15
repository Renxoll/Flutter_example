class Destination {
  final String? explanation;
  final String title;
  final String? url;
  final String mediaCategory;
  
  
  Destination({
    this.explanation,
    required this.title,
    this.url,
    required this.mediaCategory,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      mediaCategory: json['media_type'] as String,
      explanation: json['explanation'] as String?,
      title: json['title'] as String,
      url: json['url'] as String?,
    );
  }
}