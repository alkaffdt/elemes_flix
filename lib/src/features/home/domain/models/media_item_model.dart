class MediaItem {
  final String? backdropPath;
  final String? posterPath;
  final int? id;
  final double? voteAverage;
  final int? voteCount;
  final String? mediaType;

  bool get isMovie => mediaType == 'movie';
  bool get isTv => mediaType == 'tv';

  MediaItem({
    this.backdropPath,
    this.posterPath,
    this.id,
    this.voteAverage,
    this.voteCount,
    this.mediaType,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      id: json['id'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      mediaType: json['media_type'],
    );
  }
}
