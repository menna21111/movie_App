part of 'fav_bloc.dart';

@immutable
sealed class FavEvent {}

class GetFavEvent extends FavEvent {}
class UpdateFavEvent extends FavEvent {
  final List<MovieDetailss> updatedMovies;

  UpdateFavEvent(this.updatedMovies);
}