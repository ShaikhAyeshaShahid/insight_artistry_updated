import 'dart:convert';

/// rate : 3.9
/// count : 120

Rating ratingFromJson(String str) => Rating.fromJson(json.decode(str));
String ratingToJson(Rating data) => json.encode(data.toJson());
class Rating {
  Rating({
      this.rate, 
      this.count,});

  Rating.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }
  double? rate;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = rate;
    map['count'] = count;
    return map;
  }

}