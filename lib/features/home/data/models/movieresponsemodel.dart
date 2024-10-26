class MovieResponse {
  Dates? dates;  
  int? page;  // Make nullable
  List<Movie> results;

  MovieResponse({
    required this.dates,
    required this.page,  // Nullable
    required this.results,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      dates: json['dates'] != null ? Dates.fromJson(json['dates']) : null,  
      page: json['page'],  // Nullable int
      results: List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': dates?.toJson(),  // Convert to JSON if not null
      'page': page,  // Nullable field
      'results': List<dynamic>.from(results.map((x) => x.toJson())),
    };
  }
}


class Dates {
  String? maximum;
  String? minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }
}

class Movie {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int? id;  
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool video;
  double voteAverage;
  int? voteCount;  // Nullable int

  Movie({
    required this.adult,
    this.backdropPath,  // Nullable
    required this.genreIds,
    this.id,  // Nullable
    this.originalLanguage,  // Nullable
    this.originalTitle,  // Nullable
    this.overview,  // Nullable
    required this.popularity,
    this.posterPath,  // Nullable
    this.releaseDate,  // Nullable
    this.title,  // Nullable
    required this.video,
    required this.voteAverage,
    this.voteCount,  // Nullable
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false,  // Provide default value
      backdropPath: json['backdrop_path'],  // Allow nullable
      genreIds: List<int>.from(json['genre_ids'] ?? []),  // Default to empty list
      id: json['id'],  // Nullable int
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: (json['popularity'] ?? 0).toDouble(),  // Default to 0
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'] ?? false,  // Provide default value
      voteAverage: (json['vote_average'] ?? 0).toDouble(),  // Default to 0
      voteCount: json['vote_count'],  // Nullable int
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
      'id': id,  // Can be null in JSON
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,  // Can be null in JSON
    };
  }
}
