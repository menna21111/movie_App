import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../data/models/moviedetails.dart';
import 'fav_bloc.dart';


class Updatebloc extends Bloc<FavEvent, FavState> {
  Updatebloc() : super(FavInitial()) {
    on<FavEvent>((event, emit) {
       if(event is UpdateFavEvent ){
        emit(Favscuess(event.updatedMovies));
      }
    });
  }
}
