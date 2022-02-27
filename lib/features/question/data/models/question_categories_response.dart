import 'package:astro/core/models/base_api_response.dart';
import 'package:astro/features/question/data/models/question_category_data.dart';

class QuestionCategoriesResponse extends BaseAPIResponse {
  List<QuestionCategoryData>? data;

  QuestionCategoriesResponse({
    required this.data,
    required String? httpStatus,
    required int? httpStatusCode,
    required bool? success,
    String? message,
  }) : super(
          httpStatus: httpStatus,
          httpStatusCode: httpStatusCode,
          success: success,
          message: message,
        );

  QuestionCategoriesResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (json['data'] != null) {
      data = <QuestionCategoryData>[];
      json['data'].forEach((v) {
        data!.add(QuestionCategoryData.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
