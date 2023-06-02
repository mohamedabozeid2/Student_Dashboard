import 'package:get_it/get_it.dart';

import '../../features/data/data_source/login_remote_data_source.dart';
import '../../features/data/data_source/register_remote_data_source.dart';
import '../../features/data/repositories/login_repository.dart';
import '../../features/data/repositories/register_repository.dart';
import '../../features/domain/repositories/base_login_repository.dart';
import '../../features/domain/repositories/base_register_repository.dart';
import '../../features/domain/use_cases/login_use_cases/get_student_data_use_case.dart';
import '../../features/domain/use_cases/login_use_cases/student_login.dart';
import '../../features/domain/use_cases/register_use_cases/add_student_to_firestore.dart';
import '../../features/domain/use_cases/register_use_cases/student_register.dart';
import '../../features/presentation/controller/login_cubit/login_cubit.dart';
import '../../features/presentation/controller/main_cubit/main_cubit.dart';
import '../../features/presentation/controller/register_cubit/register_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //// Cubit
    sl.registerLazySingleton(() => MainCubit());
    sl.registerLazySingleton(() => RegisterCubit(sl(), sl()));
    sl.registerLazySingleton(() => LoginCubit(sl(), sl()));

    /////Use Cases
    sl.registerLazySingleton(() => StudentRegisterUseCase(sl()));
    sl.registerLazySingleton(() => AddStudentToFireStoreUseCase(sl()));
    sl.registerLazySingleton(() => StudentLoginUseCase(sl()));
    sl.registerLazySingleton(() => GetStudentDataUseCase(sl()));

    ////Repositories
    sl.registerLazySingleton<BaseRegisterRepository>(
        () => RegisterRepository(sl()));
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));

    ////Data Source
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
        () => RegisterRemoteDataSource());
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource());
  }
}
