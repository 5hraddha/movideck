import 'package:get_it/get_it.dart';
import '../services/web_api/web_api.dart';
import '../services/web_api/web_api_implementation.dart';
import '../services/storage/storage_service.dart';
import '../services/storage/storage_service_implementation.dart';
import '../business_logic/view_models/viewmodels.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImplementation());
  serviceLocator.registerLazySingleton<StorageService>(
      () => StorageServiceImplementation());

  // view models
  serviceLocator.registerFactory<HomeViewModel>(() => HomeViewModel());
  serviceLocator
      .registerFactory<MovieDetailViewModel>(() => MovieDetailViewModel());
  serviceLocator.registerFactory<BottomNavigationBarViewModel>(
      () => BottomNavigationBarViewModel());
}
