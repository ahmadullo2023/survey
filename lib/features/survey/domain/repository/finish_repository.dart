import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/singletons/service_locator.dart';
import '../../data/data_sourse/data_source.dart';

part '../../data/repository/finish_repository_impl.dart';


abstract class FinishRepository {
  Future<Either<Failure, void>> postSurveyFinish({
    required String surId,
    required String queId,
    required Map<String, dynamic> optionsData,
  });
}
