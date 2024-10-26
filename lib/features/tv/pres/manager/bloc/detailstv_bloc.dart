import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/features/tv/data/tvrepo.dart';

import '../../../../../core/eror/failure.dart';
import '../../../data/models/tvdetails.dart';

part 'detailstv_event.dart';
part 'detailstv_state.dart';

class DetailstvBloc extends Bloc<DetailstvEvent, DetailstvState> {
  final Tvrepo tvrepo;
  DetailstvBloc( this.tvrepo) : super(DetailstvInitial()) {
    on<DetailstvEvent>((event, emit) async {
     if (event is TvGETDetail) {
        //details
        emit(TvDetailsLoading());
        final response = await tvrepo.getdetailstv(event.tvid);

        response.fold((l) => emit(TvDetailsFailure(l)),
            (r) => emit(TvDetailsSuccess(r)));
      }  
    });
  }
}
