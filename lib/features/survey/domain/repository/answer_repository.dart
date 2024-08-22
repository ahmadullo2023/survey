import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/singletons/service_locator.dart';
import '../../data/data_sourse/data_source.dart';
part '../../data/repository/answer_repository_impl.dart';

abstract class AnswerRepository {
  Future<Either<Failure, void>> postSurveyAnswer({
    required String surId,
    required String queId,
  });
}