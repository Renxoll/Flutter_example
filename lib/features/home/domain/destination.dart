class Destination {
  final String? explanation;
  final String title;
  final String? url;
  
  
  Destination({
    this.explanation,
    required this.title,
    this.url,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      explanation: json['explanation'] as String?,
      title: json['title'] as String,
      url: json['url'] as String?,
    );
  }
}