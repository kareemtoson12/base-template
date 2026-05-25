import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 1. Networking (Dio & ApiService)
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // 2. Data Sources & Repositories
  // Example: getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));

  // 3. Blocs & Cubits
  // Example: getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
