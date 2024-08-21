import 'branlogo_model.dart';

class Company {
  String? id;
  String? name;
  String? slug;
  double? oldReviewRating;
  BrandLogo? brandLogo;
  bool? verified;
  Type? type;
  bool? isPrivate;
  int? reviewCount;
  String? address;

  Company(
      {this.id,
        this.name,
        this.slug,
        this.oldReviewRating,
        this.brandLogo,
        this.verified,
        this.type,
        this.isPrivate,
        this.reviewCount,
        this.address});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    oldReviewRating = json['old_review_rating'];
    brandLogo = json['brand_logo'] != null
        ? new BrandLogo.fromJson(json['brand_logo'])
        : null;
    verified = json['verified'];
    type = json['type'];
    isPrivate = json['is_private'];
    reviewCount = json['review_count'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['old_review_rating'] = this.oldReviewRating;
    if (this.brandLogo != null) {
      data['brand_logo'] = this.brandLogo!.toJson();
    }
    data['verified'] = this.verified;
    data['type'] = this.type;
    data['is_private'] = this.isPrivate;
    data['review_count'] = this.reviewCount;
    data['address'] = this.address;
    return data;
  }
}