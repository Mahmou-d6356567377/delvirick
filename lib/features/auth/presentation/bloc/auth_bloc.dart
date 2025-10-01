import 'package:bloc/bloc.dart';
import 'package:delvirick/features/auth/domain/usecases/login_usecase.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_event.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await loginUseCase(
          email: event.email,
          password: event.password,
        );

        final token = result['token'] as String?;
        if (token != null && token.isNotEmpty) {
          emit(AuthSuccess(token));
        } else {
          // Pick best available error info
          final errorMessage = result['message'] ??
              (result['errors'] != null && result['errors'].isNotEmpty
                  ? result['errors'].join(", ")
                  : result['title'] ?? "Unknown error");
          emit(AuthFailure(errorMessage.toString()));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
