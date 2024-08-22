class BrandLogo {
  String? id;
  String? original;
  String? s100x100;
  String? s500x500;
  String? s1000x1000;
  String? thumbnail;

  BrandLogo(
      {this.id,
        this.original,
        this.s100x100,
        this.s500x500,
        this.s1000x1000,
        this.thumbnail});

  BrandLogo.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    original = json['original'] ?? "";
    s100x100 = json['s100x100'] ?? "";
    s500x500 = json['s500x500'] ?? "";
    s1000x1000 = json['s1000x1000'] ?? "";
    thumbnail = json['thumbnail'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['original'] = this.original;
    data['s100x100'] = this.s100x100;
    data['s500x500'] = this.s500x500;
    data['s1000x1000'] = this.s1000x1000;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}