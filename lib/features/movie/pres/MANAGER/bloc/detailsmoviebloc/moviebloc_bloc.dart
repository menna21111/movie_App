import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/core/eror/failure.dart';

import '../../../../../home/data/models/movieresponsemodel.dart';
import '../../../../data/models/castmodel.dart';
import '../../../../data/models/moviedetails.dart';
import '../../../../data/models/review.dart';
import '../../../../data/models/videomodel.dart';
import '../../../../data/movierepo.dart';

part 'moviebloc_event.dart';
part 'moviebloc_state.dart';

class MovieblocBloc extends Bloc<MovieblocEvent, MovieblocState> {
  final Movierepo movierepo;
  MovieblocBloc(this.movierepo) : super(MovieblocInitial()) {
    on<MovieblocEvent>((event, emit) async {
      if (event is MovIEGETDetail) {
        //details
        emit(MovieDetailsLoading());
        final response = await movierepo.getdetailsmov(event.movieid);

        response.fold((l) => emit(MovieDetailsFailure(l)),
            (r) => emit(MovieDetailsSuccess(r)));
      }  
    });
  }
}
