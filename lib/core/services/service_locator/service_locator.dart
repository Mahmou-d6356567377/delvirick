import 'package:delvirick/features/auth/data/repos/login/login_repo_IMPL.dart';
import 'package:get_it/get_it.dart';
import 'package:delvirick/features/auth/data/repos/login/login_repo.dart';
import 'package:delvirick/features/auth/domain/usecases/login_usecase.dart';
import 'package:delvirick/features/auth/domain/usecases/register_usecase.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  // 🔹 Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // 🔹 Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => RegisterUsecase(sl<AuthRepository>()));

  // 🔹 Bloc
  sl.registerFactory(() => AuthBloc(sl<LoginUseCase>(), sl<RegisterUsecase>()));
}
