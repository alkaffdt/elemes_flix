class SearchItem {
  final int id;
  final bool? adult;
  final String? name;
  final String? originalName;
  final String? mediaType;
  final double? popularity;
  final int? gender;
  final String? knownForDepartment;
  final String? profilePath;
  final String? backdropPath;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? originalLanguage;

  // Media type checkers
  bool get isPerson => mediaType == 'person';
  bool get isMovie => mediaType == 'movie';
  bool get isTVShow => mediaType == 'tv';

  // Image path getters
  String? get imagePath => isPerson
      ? profilePath
      : isMovie || isTVShow
      ? posterPath
      : null;

  SearchItem({
    required this.id,
    this.adult,
    this.name,
    this.originalName,
    this.mediaType,
    this.popularity,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
    this.backdropPath,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.originalLanguage,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      id: json['id'],
      adult: json['adult'],
      name: json['name'],
      originalName: json['original_name'],
      mediaType: json['media_type'],
      popularity: json['popularity']?.toDouble(),
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      profilePath: json['profile_path'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      originalLanguage: json['original_language'],
    );
  }
}
