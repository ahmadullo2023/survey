import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/singletons/service_locator.dart';
import '../../data/data_sourse/data_source.dart';
part '../../data/repository/reject_repository_impl.dart';


abstract class RejectRepository {
  Future<Either<Failure, void>> postRejectSurvey({required String id});

}