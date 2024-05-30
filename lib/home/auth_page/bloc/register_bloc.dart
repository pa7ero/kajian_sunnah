import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '/service/auth_service.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;
  RegisterBloc({required this.authRepository}) : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        var data = await authRepository.register(
          event.name,
          event.email,
          event.password,
          event.password_confirmation,
          event.address,
          event.phone,
          event.gender,
        );
        emit(RegisterSuccess(data));
      } catch (e) {
        emit(RegisterFailure(e.toString()));
      }
    });
  }
}
