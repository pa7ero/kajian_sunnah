import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '/service/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

//   LoginBloc(this._authRepository) : super(LoginInitial()) {
//     on<LoginButtonPressed>((event, emit) async {
//       emit(LoginLoading());
//       try {
//         var userData = await _authRepository.login(event.email, event.password);
//         emit(LoginSuccess(userData));
//       } catch (e) {
//         emit(LoginFailure(e.toString()));
//       }
//     });
//   }
// }
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      var userData = await authRepository.login(event.email, event.password);
      emit(LoginSuccess(userData));
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
