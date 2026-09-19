class MediaItem {
  final String? backdropPath;
  final String? posterPath;
  final int? id;
  final double? voteAverage;
  final int? voteCount;
  final String? mediaType;
  final String? profilePath;
  final String? name;

  bool get isMovie => mediaType == 'movie';
  bool get isTv => mediaType == 'tv';
  bool get isPerson => mediaType == 'person';

  String? get image => isPerson ? profilePath : posterPath;

  MediaItem({
    this.backdropPath,
    this.posterPath,
    this.id,
    this.voteAverage,
    this.voteCount,
    this.mediaType,
    this.profilePath,
    this.name,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      id: json['id'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      mediaType: json['media_type'],
      profilePath: json['profile_path'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'id': id,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'media_type': mediaType,
      'profile_path': profilePath,
      'name': name,
    };
  }
}
