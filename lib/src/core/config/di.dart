part of 'config.dart';

var getit = GetIt.instance;

void diRegister() {
  getit.registerLazySingleton<RegisterUsecase>(() {
    return RegisterUsecase(getit());
  });

 

  getit.registerLazySingleton<AuthRepo >(
    () => AuthRepositoryImp(remoteDataSource: getit()),
  );

    getit.registerLazySingleton<AuthRemoteDataSource >(
    () => AuthRemoteDataSource(getit() ),
  );

     getit.registerLazySingleton<DioClient >(
    () => DioClient(),
  );

  //============================================

    getit.registerLazySingleton<LoginUsecase>(() {
    return LoginUsecase(getit());
  });
}
