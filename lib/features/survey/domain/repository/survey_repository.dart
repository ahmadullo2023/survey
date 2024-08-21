import 'package:survey/features/survey/domain/entities/survey_entities.dart';
import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/singletons/service_locator.dart';
import '../../data/data_sourse/data_source.dart';
part '../../data/repository/survey_repository_impl.dart';

abstract class SurveyRepository {
  Future<Either<Failure, GetSurveyEntity>> getSurvey();
}