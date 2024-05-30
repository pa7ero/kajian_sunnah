import 'package:bloc/bloc.dart';
//  import 'package:kajian_sunnah/model/topik_model.dart';
import 'package:kajian_sunnah/service/topik_service.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class TopikBloc extends Bloc<TopikEvent, TopikState> {
  final TopikService topikService;
  TopikBloc(this.topikService) : super(TopikInitial()) {
    on<FetchTopik>((event, emit) async {
      emit(TopikLoading());
      try {
        final result = await topikService.get();
        emit(TopikLoaded(result));
      } catch (e) {
        emit(TopikError(
          e.toString(),
        ));
      }
    });
  }
}
