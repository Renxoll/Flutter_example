enum MediaCategoryFilter {
  all,
  image,
  video,
}

extension MediaCategoryExtension on MediaCategoryFilter {
  String get value {
    switch (this) {
      case MediaCategoryFilter.all:
        return 'all';
      case MediaCategoryFilter.image:
        return 'image';
      case MediaCategoryFilter.video:
        return 'video';
    }
  }

  String get displayName {
    switch (this) {
      case MediaCategoryFilter.all:
        return 'Todo';
      case MediaCategoryFilter.image:
        return 'Imágenes';
      case MediaCategoryFilter.video:
        return 'Videos';
    }
  }
}