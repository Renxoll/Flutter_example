class Destination {
  final String? explanation;
  final String title;
  final String? hdurl;
  
  
  Destination({
    this.explanation,
    required this.title,
    this.hdurl,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      explanation: json['explanation'] as String?,
      title: json['title'] as String,
      hdurl: json['hdurl'] as String?,
    );
  }
}