import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:survey/core/singletons/storage/storage.dart';
import '../../features/survey/data/data_sourse/data_source.dart';
import '../../features/survey/domain/repository/answer_repository.dart';
import '../../features/survey/domain/repository/finish_repository.dart';
import '../../features/survey/domain/repository/reject_repository.dart';
import '../../features/survey/domain/repository/survey_repository.dart';
import '../../features/survey/domain/usecase/answer_usecase.dart';
import '../../features/survey/domain/usecase/finish_usecase.dart';
import '../../features/survey/domain/usecase/reject_usecase.dart';
import '../../features/survey/domain/usecase/survey_usecase.dart';
import 'dio_settings.dart';


final serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton<DioSettings>(() => DioSettings());


  serviceLocator.registerLazySingleton(() => GetSurveyListUseCase());

  serviceLocator.registerLazySingleton(() => SurveyDataSourceImpl(serviceLocator<DioSettings>().dio()));
  serviceLocator.registerLazySingleton(() => SurveyRepositoryImpl());

  serviceLocator.registerLazySingleton(() => AnswerRepositoryImpl());
  serviceLocator.registerLazySingleton(() => AnswerSurveyUseCase());

  serviceLocator.registerLazySingleton(() => RejectRepositoryImpl());
  serviceLocator.registerLazySingleton(() => RejectSurveyUseCase());

  serviceLocator.registerLazySingleton(() => FinishRepositoryImpl());
  serviceLocator.registerLazySingleton(() => FinishSurveyUseCase());

}


