import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/eror/failure.dart';
import '../../../../../../home/data/models/movieresponsemodel.dart';
import '../../../../../data/movierepo.dart';

part 'similiar_event.dart';
part 'similiar_state.dart';

class SimiliarBloc extends Bloc<SimiliarEvent, SimiliarState> {
    final Movierepo movierepo;
  SimiliarBloc(this.movierepo) : super(SimiliarInitial()) {
    on<SimiliarEvent>((event, emit) async{
     if (event is MovIEGETsimilar) {
        //similar
        emit(MovieSIMILARLOADING());
        final response = await movierepo.getsimiliarmov(event.movieid);

        response.fold((l) => emit(MovieSIMILARFALIURE(l)),
            (r) => emit(MovieSIMILARSUCCESS(r)));
      }
    });
  }
}
