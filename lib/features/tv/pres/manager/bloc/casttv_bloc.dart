import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/eror/failure.dart';
import '../../../../movie/data/models/castmodel.dart';
import '../../../data/models/tvresponse.dart';
import '../../../data/tvrepo.dart';

part 'casttv_event.dart';
part 'casttv_state.dart';

class CasttvBloc extends Bloc<CasttvEvent, CasttvState> {
    final Tvrepo tvrepo;
  CasttvBloc( this.tvrepo) : super(CasttvInitial()) {
    
    on<CasttvEvent>((event, emit) async  {
          if (event is GetCasttv) {
        //cast
        emit(TvCastLoading());
        final response = await tvrepo.populartv();

        response.fold(
            (l) => emit(TvCastFailure(l)), (r) => emit(TVCastSuccess(r)));
      }
    });
  }
}
