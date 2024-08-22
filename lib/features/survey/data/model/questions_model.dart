import 'package:survey/features/survey/data/model/survey_info_model.dart';

import 'options_model.dart';

class Questions {
  String? id;
  String? type;
  String? question;
  String? optionType;
  List<Options>? options;

  Questions({this.id, this.type, this.question, this.optionType, this.options});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "" ;
    type = json['type'] ?? "";
    question = json['question'] ?? "";
    optionType = json['option_type'] ?? "";
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['question'] = this.question;
    data['option_type'] = this.optionType;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}