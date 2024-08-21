import 'package:survey/features/survey/data/model/questions_model.dart';
import 'company_model.dart';

class SurveyInfoModel {
  String? id;
  String? title;
  String? startFrom;
  String? endAt;
  bool? published;
  bool? paused;
  Company? company;
  List<Questions>? questions;
  int? price;

  SurveyInfoModel(
      {this.id,
        this.title,
        this.startFrom,
        this.endAt,
        this.published,
        this.paused,
        this.company,
        this.questions,
        this.price});
  factory SurveyInfoModel.fromJson(Map<String,dynamic>json)=> SurveyInfoModel(
    id: json['id'],
    company: json['company'] != null ? Company.fromJson(json['company']) : null,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['start_from'] = this.startFrom;
    data['end_at'] = this.endAt;
    data['published'] = this.published;
    data['paused'] = this.paused;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    return data;
  }
}
