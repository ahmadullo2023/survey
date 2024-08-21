import 'package:equatable/equatable.dart';
import '../../data/model/company_model.dart';
import '../../data/model/questions_model.dart';
import '../../data/model/survey_info_model.dart';

class GetSurveyEntity extends Equatable {
  const GetSurveyEntity({
    required this.surveyList,
  });

  final SurveyEntity surveyList;

  @override
  List<Object?> get props => [surveyList];
}

class SurveyEntity {
  final String id;
  final String title;
  final String startFrom;
  final String endAt;
  final bool published;
  final bool paused;
  //final Company company;
  final List<Questions> questions;
  final int price;

  const SurveyEntity({
      this.id = '',
      this.title = '',
      this.startFrom = '',
      this.endAt = '',
      this.published = false,
      this.paused = false,
      //this.company = const Company(),
      this.questions = const [],
      this.price = 0
  });
}

extension GetSurveyxResponseEntity on SurveyInfoModel {
  GetSurveyEntity toEntity() => GetSurveyEntity(
        surveyList: SurveyEntity(
          id: id ?? '',
          title: title ?? '',
          startFrom: startFrom ?? '',
          endAt: endAt ?? '',
          published: published ?? false,
          paused: paused ?? false,
          questions: questions ?? [],
          price: price ?? 0,
        ),
      );
}
