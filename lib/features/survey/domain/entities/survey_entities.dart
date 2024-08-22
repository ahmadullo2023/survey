import 'package:equatable/equatable.dart';
import '../../data/model/questions_model.dart';

class GetSurveyEntity extends Equatable {
  final String id;
  final String title;
  final String startFrom;
  final String endAt;
  final bool published;
  final bool paused;
  //final Company company;
  final List<Questions> questions;
  final int price;

  const GetSurveyEntity({
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

  @override
  List<Object?> get props => [id, title, startFrom, endAt, published, paused, questions, price];
}
