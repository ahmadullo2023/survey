import 'package:survey/features/survey/data/model/questions_model.dart';
import '../../domain/entities/survey_entities.dart';
import 'company_model.dart';

class SurveyInfoModel extends GetSurveyEntity {
   SurveyInfoModel({
    super.id,
    super.title,
    super.startFrom,
    super.endAt,
    super.published,
    super.paused,
    //super.company,
    super.questions,
    super.price,
  });

  factory SurveyInfoModel.fromJson(Map<String,dynamic>json)=> SurveyInfoModel(
    id: json['id'] ?? "",
   // company: json['company'] != null ? Company.fromJson(json['company']) : null,
    title: json['title'] ?? "",
    startFrom: json['startFrom'] ?? "",
    endAt: json['endAt'] ?? "",
    published: json['published'] ?? false,
    price: json['price'] ?? 0,
    paused: json['paused'] ?? false,
    questions: (json['questions'] as List<dynamic>?)?.map((questions) => Questions.fromJson(questions)).toList() ?? const [],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['start_from'] = this.startFrom;
    data['end_at'] = this.endAt;
    data['published'] = this.published;
    data['paused'] = this.paused;
    // if (this.company != null) {
    //   data['company'] = this.company!.toJson();
    // }
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    return data;
  }
}
