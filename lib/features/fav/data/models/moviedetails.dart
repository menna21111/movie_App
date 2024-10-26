import 'package:hive/hive.dart';

part 'moviedetails.g.dart'; // Ensure you have the generated part file

@HiveType(typeId: 0) // Use a unique typeId
class MovieDetailss {
  @HiveField(0)
  bool adult;

  @HiveField(1)
  String? backdropPath;

  @HiveField(2)
  String? belongsToCollection;

  @HiveField(3)
  int? budget;

  @HiveField(4)
  String? homepage;

  @HiveField(5)
  int? id;

  @HiveField(6)
  String? imdbId;

  @HiveField(7)
  List<String> originCountry;

  @HiveField(8)
  String? originalLanguage;

  @HiveField(9)
  String? originalTitle;

  @HiveField(10)
  String? overview;

  @HiveField(11)
  double popularity;

  @HiveField(12)
  String? posterPath;

  @HiveField(13)
  String? releaseDate;

  @HiveField(14)
  int? revenue;

  @HiveField(15)
  int? runtime;

  @HiveField(16)
  String? status;

  @HiveField(17)
  String? tagline;

  @HiveField(18)
  String? title;

  @HiveField(19)
  bool video;

  @HiveField(20)
  double voteAverage;

  @HiveField(21)
  int? voteCount;

  MovieDetailss({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.homepage,
    this.id,
    this.imdbId,
    required this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    required this.video,
    required this.voteAverage,
    this.voteCount,
  });

  // Factory constructor to create MovieDetailss from JSON
  factory MovieDetailss.fromJson(Map<String, dynamic> json) {
    return MovieDetailss(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country']),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'],
    );
  }

 
 
}
