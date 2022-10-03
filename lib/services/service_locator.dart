import 'package:get_it/get_it.dart';
import '../services/web_api/web_api.dart';
import '../services/web_api/web_api_implementation.dart';
import '../business_logic/view_models/viewmodels.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImplementation());

  // view models
  serviceLocator.registerFactory<HomeViewModel>(() => HomeViewModel());
  serviceLocator
      .registerFactory<MovieDetailViewModel>(() => MovieDetailViewModel());
}
