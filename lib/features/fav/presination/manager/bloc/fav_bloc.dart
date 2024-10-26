import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../data/models/moviedetails.dart';

part 'fav_event.dart';
part 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  FavBloc() : super(FavInitial()) {
    on<FavEvent>((event, emit) {
      if (event is GetFavEvent) {
        emit(FavLoading());
        try {
          var moviesBox = Hive.box<MovieDetailss>('movieBox');
          List<MovieDetailss> movieDetails = moviesBox.values.toList();
          emit(Favscuess(movieDetails));
          print(movieDetails);
        } catch (e) {
          emit(FavFail('Failed to load movies'));
        }
      }
      
    });
  }
}
