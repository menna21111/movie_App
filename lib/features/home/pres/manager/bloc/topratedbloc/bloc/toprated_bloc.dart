import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/eror/failure.dart';
import '../../../../../data/homerepo.dart';
import '../../../../../data/models/movieresponsemodel.dart';

part 'toprated_event.dart';
part 'toprated_state.dart';

class TopratedBloc extends Bloc<TopratedEvent, TopratedState> {
  final Homerepo homerepo;
  TopratedBloc(this.homerepo) : super(TopratedInitial()) {
    on<TopratedEvent>((event, emit) async{
      if (event is Gettoprated)  {
        emit(Loadingtoprated());
        final result = await homerepo.gettoprated();
        result.fold((l) {
          emit(Failuretoprated(l));
        }, (r) {
          emit(Scucesstoprated(r));
        });
      }
    });
  }
}
