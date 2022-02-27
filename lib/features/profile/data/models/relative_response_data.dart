import 'package:astro/features/profile/data/models/relative_data.dart';

class RelativeResponseData {
  int? pageNo;
  int? numberOfElements;
  int? pageSize;
  int? totalElements;
  int? totalPages;
  List<RelativeData>? allRelatives;

  RelativeResponseData({
    this.pageNo,
    this.numberOfElements,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.allRelatives,
  });

  RelativeResponseData.fromJson(Map<String, dynamic> json) {
    pageNo = json['pageNo'];
    numberOfElements = json['numberOfElements'];
    pageSize = json['pageSize'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    if (json['allRelatives'] != null) {
      allRelatives = <RelativeData>[];
      json['allRelatives'].forEach((v) {
        allRelatives!.add(RelativeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pageNo'] = this.pageNo;
    data['numberOfElements'] = this.numberOfElements;
    data['pageSize'] = this.pageSize;
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    if (this.allRelatives != null) {
      data['allRelatives'] = this.allRelatives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
