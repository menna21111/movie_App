// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviedetails.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailssAdapter extends TypeAdapter<MovieDetailss> {
  @override
  final int typeId = 0;

  @override
  MovieDetailss read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailss(
      adult: fields[0] as bool,
      backdropPath: fields[1] as String?,
      belongsToCollection: fields[2] as String?,
      budget: fields[3] as int?,
      homepage: fields[4] as String?,
      id: fields[5] as int?,
      imdbId: fields[6] as String?,
      originCountry: (fields[7] as List).cast<String>(),
      originalLanguage: fields[8] as String?,
      originalTitle: fields[9] as String?,
      overview: fields[10] as String?,
      popularity: fields[11] as double,
      posterPath: fields[12] as String?,
      releaseDate: fields[13] as String?,
      revenue: fields[14] as int?,
      runtime: fields[15] as int?,
      status: fields[16] as String?,
      tagline: fields[17] as String?,
      title: fields[18] as String?,
      video: fields[19] as bool,
      voteAverage: fields[20] as double,
      voteCount: fields[21] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailss obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.belongsToCollection)
      ..writeByte(3)
      ..write(obj.budget)
      ..writeByte(4)
      ..write(obj.homepage)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.imdbId)
      ..writeByte(7)
      ..write(obj.originCountry)
      ..writeByte(8)
      ..write(obj.originalLanguage)
      ..writeByte(9)
      ..write(obj.originalTitle)
      ..writeByte(10)
      ..write(obj.overview)
      ..writeByte(11)
      ..write(obj.popularity)
      ..writeByte(12)
      ..write(obj.posterPath)
      ..writeByte(13)
      ..write(obj.releaseDate)
      ..writeByte(14)
      ..write(obj.revenue)
      ..writeByte(15)
      ..write(obj.runtime)
      ..writeByte(16)
      ..write(obj.status)
      ..writeByte(17)
      ..write(obj.tagline)
      ..writeByte(18)
      ..write(obj.title)
      ..writeByte(19)
      ..write(obj.video)
      ..writeByte(20)
      ..write(obj.voteAverage)
      ..writeByte(21)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailssAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
