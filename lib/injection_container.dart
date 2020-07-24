import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:terafits/features/settings/presentation/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());

  // Bloc
  sl.registerFactory(
    () => ThemeBloc(),
  );

  // Use cases

  // Repository

  // Data sources

  // DAO

  // Database

  // Services

  // Core
}
