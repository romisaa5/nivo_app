import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nivo/core/helpers/secure_storage_helper.dart';
import 'package:nivo/core/helpers/shared_pref_helper.dart';
import 'package:nivo/features/authentication/data/repositories/auth_repository.dart';
import 'package:nivo/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:nivo/features/authentication/data/services/firebase_auth_service.dart';
import 'package:nivo/features/authentication/manager/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  final sharedPrefs = await SharedPrefHelper.init();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<SecureStorageHelper>(
    () => SecureStorageHelper(getIt<FlutterSecureStorage>()),
  );

  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Authentication
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => const FirebaseAuthService(),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<FirebaseAuthService>(),
      getIt<SecureStorageHelper>(),
    ),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(getIt<AuthRepository>()),
  );
}
