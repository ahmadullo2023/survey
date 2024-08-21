class Options {
  String? id;
  String? choice;

  Options({this.id, this.choice});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    choice = json['choice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['choice'] = this.choice;
    return data;
  }
}