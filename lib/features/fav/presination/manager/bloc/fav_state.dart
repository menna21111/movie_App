part of 'fav_bloc.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class Favscuess extends FavState {
  final List<MovieDetailss> movieDetails;

  Favscuess(this.movieDetails);
}

final class FavFail extends FavState {
    final String message;

  FavFail(this.message);
}
