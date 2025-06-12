import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:real_estate_app/core/network/network_info.dart';
import 'package:real_estate_app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../features/buildings/data/datasources/remote_data.dart';
import '../features/buildings/data/repositories/building_repository_impl.dart';
import '../features/buildings/domain/repositories/building_repository.dart';
import '../features/buildings/domain/usecases/filter_building.dart';
import '../features/buildings/domain/usecases/get_building_details.dart';
import '../features/buildings/domain/usecases/get_buildings.dart';
import '../features/buildings/presentation/bloc/building_bloc.dart';
import '../features/onboarding/data/repositories/onboarding_repository_impl.dart';
import '../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../features/onboarding/domain/usecases/get_onboarding_seen.dart';
import '../features/onboarding/domain/usecases/save_onboarding_seen.dart';
import '../features/onboarding/presentation/bloc/onboarding_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory(
    () => BuildingBloc(
      getBuildings: sl(),
      getBuildingDetails: sl(),
      filterBuilding: sl(),
    ),
  );

  
  sl.registerLazySingleton(() => GetBuildings(sl()));
  sl.registerLazySingleton(() => GetBuildingDetails(sl()));
  sl.registerLazySingleton(() => FilterBuilding(sl()));

  
  sl.registerLazySingleton<BuildingRepository>(
    () => BuildingRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<BuildingRemoteDataSource>(
    () => BuildingRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerFactory(() => SplashBloc(getOnboardingSeen: sl()));
  sl.registerFactory(() => OnboardingBloc(getSeen: sl(), saveSeen: sl()));
  sl.registerLazySingleton(() => GetOnboardingSeen(sl()));
  sl.registerLazySingleton(() => SaveOnboardingSeen(sl()));
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => InternetConnection());
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectivity: sl(),
      connectionChecker: sl(),
    ),
  );
}
