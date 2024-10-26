import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/eror/failure.dart';
import '../../../../home/data/models/movieresponsemodel.dart';
import '../../../data/genrerepo.dart';

part 'moviegeners_event.dart';
part 'moviegeners_state.dart';

class MoviegenersBloc extends Bloc<MoviegenersEvent, MoviegenersState> {
    final Generrepo generrepo;
  MoviegenersBloc( this.generrepo) : super(MoviegenersInitial()) {

    on<MoviegenersEvent>((event, emit)async {
     if (event is GetmovieGenres) {
        emit(GetmovieGenresloadingstate());
 final result = await generrepo.getmoviegener(event.genreid);
        result.fold((l) {
          emit(GetmovieGenresfailurestate(l));
        }, (r) {
          emit(GetmovieGenressucessgstate(r));
        });

      }    
    });
  }
}
