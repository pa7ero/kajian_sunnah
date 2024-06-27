import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '/service/auth_service.dart';
// import '/model/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({
    required this.authRepository,
  }) : super(LoginInitial()) {
    // on<AppStarted>((event, emit) async {
    //   emit(LoginLoading());
    //   try {
    //     final token = await authRepository.getToken();
    //     if (token != '') {
    //       emit(LoginSuccess(User(token: token.toString())));
    //     } else {
    //       emit(LoginInitial());
    //     }
    //   } catch (e) {
    //     emit(LoginFailure(e.toString()));
    //   }
    // });

    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final userData = await authRepository.login(event.email, event.password);
      // if (userData != null) {
      // final user = User.fromJson(userData);
      emit(LoginSuccess(userData));
      // } else {
      //   emit(LoginFailure('Login Gagal'));
      // }
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
