import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/eror/failure.dart';
import '../../../../../data/homerepo.dart';
import '../../../../../data/models/movieresponsemodel.dart';

part 'populars_event.dart';
part 'populars_state.dart';

class PopularsBloc extends Bloc<PopularsEvent, PopularsState> {
    final Homerepo homerepo;
  PopularsBloc( this.homerepo) : super(PopularsInitial()) {
    on<PopularsEvent>((event, emit)async {
 if (event is Getpopular) {
        emit(Loadingpopular());
        final result = await homerepo.getpopular();
        result.fold((l) {
          emit(Failurepopular(l));
        }, (r) {
          emit(Scucesspopular(r));

        });
      }
    });
  }
}
