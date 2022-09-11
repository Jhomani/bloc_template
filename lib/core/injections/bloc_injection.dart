import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/features/auth/data/datasources/user_local_data_source.dart';
import 'package:template/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:template/features/auth/data/repositories/user_repository.dart';
import 'package:template/features/auth/domain/repositories/auth_repository_abs.dart';
import 'package:template/features/auth/domain/usecases/get_cookie_session.dart';
import 'package:template/features/auth/domain/usecases/login_usecase.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';
import 'package:template/head/presentation/bloc/global_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async{

  // Cache Service
  injector.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  // Screen size
  Size size = WidgetsBinding.instance.window.physicalSize;
  double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  injector.registerSingleton<Size>(Size( (size.width/ratio), (size.height / ratio) ));

  // Data source
  injector.registerSingleton<UserLocalDataSource>(UserLocalDataSource(
    sharedPreferences: injector<SharedPreferences>()
  ));

  injector.registerSingleton<UserRemoteDataSource>(UserRemoteDataSource());

  // Repository
  injector.registerSingleton<UserRepositoryAbs>(
    UserRepository(
      injector<UserRemoteDataSource>(),
      injector<UserLocalDataSource>()
    )
  );

  // Use cases
  injector.registerSingleton<LoginUseCase>(
    LoginUseCase(injector<UserRepositoryAbs>())
  );
  injector.registerSingleton<GetLocalSession>(GetLocalSession(injector<UserRepositoryAbs>()));

  // Bloc
  injector.registerSingleton<LoginBloc>(LoginBloc(
    doSignInUseCase: injector<LoginUseCase>()
  ));

  injector.registerSingleton<GlobalBloc>(GlobalBloc(
    getSession: injector<GetLocalSession>()
  ));
}