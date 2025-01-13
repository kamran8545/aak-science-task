import 'package:aak_signup/data/remote_data_source/remote_data_source.dart';
import 'package:aak_signup/data/remote_data_source/remote_data_source_imp.dart';
import 'package:aak_signup/data/repositories_imp/user_repository_imp.dart';
import 'package:aak_signup/domain/repositories/user_repository.dart';
import 'package:aak_signup/domain/usecases/signup_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../presentation/ui/signup_screen/signup_bloc/signup_bloc.dart';

final sl = GetIt.I;

void init() {
  sl.registerLazySingleton<Dio>(()=> Dio());
  sl.registerLazySingleton<RemoteDataSource>(()=> RemoteDataSourceImp(dio: sl() ));
  sl.registerLazySingleton<UserRepository>(()=> UserRepositoryImp(remoteDataSource: sl()));


  /// UseCases
  sl.registerLazySingleton<SignupUseCase>(()=> SignupUseCase(userRepository: sl()));

  sl.registerLazySingleton(()=> SignupBloc(signupUseCase: sl()));
}