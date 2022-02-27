import 'package:astro/core/network/api_service.dart';
import 'package:astro/core/network/network_info.dart';
import 'package:astro/features/question/data/datasources/question_data_source.dart';
import 'package:astro/features/question/data/repositories/question_repository_impl.dart';
import 'package:astro/features/question/domain/repositories/question_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Core
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());

  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => APIService(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        connectTimeout: 60000,
        receiveTimeout: 60000,
      ),
    )..interceptors.addAll(
        [
          LogInterceptor(
              requestBody: true, responseBody: true, requestHeader: true),
        ],
      ),
  );

  //! Features - Question
  // Data sources
  serviceLocator.registerLazySingleton<QuestionDataSource>(
    () => QuestionDataSourceImpl(serviceLocator()),
  );
  // Repository
  serviceLocator.registerLazySingleton<QuestionRepository>(
    () => QuestionRepositoryImpl(serviceLocator(), serviceLocator()),
  );
}
