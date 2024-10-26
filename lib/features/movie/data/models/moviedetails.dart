import '../../../fav/data/models/moviedetails.dart';

class MovieDetails {
  bool adult;
  String? backdropPath;
  String? belongsToCollection;
  int? budget;
 
  String? homepage;
  int? id;
  String? imdbId;
  List<String> originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double popularity;
  String? posterPath;

  String? releaseDate;
  int? revenue;
  int? runtime;
  
  String? status;
  String? tagline;
  String? title;
  bool video;
  double voteAverage;
  int? voteCount;

  MovieDetails({
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

  // The factory constructor to create MovieDetails from JSON
factory MovieDetails.fromJson(Map<String, dynamic> json) {
  return MovieDetails(
    adult: json['adult'] ?? false,
    backdropPath: json['backdrop_path'],
    belongsToCollection: json['belongs_to_collection'] != null 
        ? json['belongs_to_collection']['name']    // Extract the name correctly
        : null,                                    // Handle null case
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

  // Add the toJson method to convert MovieDetails to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection': belongsToCollection,
      'budget': budget,

      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,

      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,

      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  // The toHiveModel method added for conversion to the Hive model
  MovieDetailss toHiveModel() {
    return MovieDetailss(
      adult: this.adult,
      backdropPath: this.backdropPath,
      belongsToCollection: this.belongsToCollection,
      budget: this.budget,
  
      homepage: this.homepage,
      id: this.id,
      imdbId: this.imdbId,
      originCountry: this.originCountry,
      originalLanguage: this.originalLanguage,
      originalTitle: this.originalTitle,
      overview: this.overview,
      popularity: this.popularity,
      posterPath: this.posterPath,

      releaseDate: this.releaseDate,
      revenue: this.revenue,
      runtime: this.runtime,
   
      status: this.status,
      tagline: this.tagline,
      title: this.title,
      video: this.video,
      voteAverage: this.voteAverage,
      voteCount: this.voteCount,
    );
  }
}




class ProductionCompany {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }
}

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iso_3166_1': iso31661,
      'name': name,
    };
  }
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'english_name': englishName,
      'iso_639_1': iso6391,
      'name': name,
    };
  }

  // Adding toHiveModel for Hive conversion
  SpokenLanguage toHiveModel() {
    return SpokenLanguage(
      englishName: this.englishName,
      iso6391: this.iso6391,
      name: this.name,
    );
  }
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Adding toHiveModel for Hive conversion
  Genre toHiveModel() {
    return Genre(
      id: this.id,
      name: this.name,
    );
  }
}
