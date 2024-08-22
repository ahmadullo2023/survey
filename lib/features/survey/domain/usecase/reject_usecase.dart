import 'package:survey/features/survey/domain/repository/reject_repository.dart';
import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/singletons/service_locator.dart';
import '../../../../core/usecase/usecase.dart';

class RejectSurveyUseCase implements UseCase<void, String> {
  final RejectRepository rejectSurvey = serviceLocator<RejectRepositoryImpl>();


  @override
  Future<Either<Failure, void>> call(String id) async {
    return await rejectSurvey.postRejectSurvey(id: id);
  }
}
