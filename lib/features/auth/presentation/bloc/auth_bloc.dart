import 'package:bloc/bloc.dart';
import 'package:delvirick/features/auth/domain/usecases/login_usecase.dart';
import 'package:delvirick/features/auth/domain/usecases/register_usecase.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_event.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUsecase registerUsecase;

  AuthBloc(this.loginUseCase, this.registerUsecase) : super(AuthInitial()) {
    // 🔹 LOGIN
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
          final errorMessage =
              result['message'] ??
              (result['errors'] != null && result['errors'].isNotEmpty
                  ? result['errors'].join(", ")
                  : result['title'] ?? "Unknown error");
          emit(AuthFailure(errorMessage.toString()));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    // 🔹 REGISTER
    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await registerUsecase(
          email: event.email,
          password: event.password,
          phone: event.phone,
          firstName: event.firstName,
          lastName: event.lastName,
          userType: event.userType,
        );

        final token = result['token'] as String?;
        if (token != null && token.isNotEmpty) {
          emit(AuthSuccess(token));
        } else {
          final errorMessage =
              result['message'] ??
              (result['errors'] != null && result['errors'].isNotEmpty
                  ? result['errors'].values
                      .expand((v) => v is Iterable ? v : [v])
                      .join(", ")
                  : result['title'] ?? "Unknown error");
          emit(AuthFailure(errorMessage.toString()));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
