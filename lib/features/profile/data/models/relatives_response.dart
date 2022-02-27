import 'package:astro/core/models/base_api_response.dart';
import 'package:astro/features/profile/data/models/relative_response_data.dart';

class RelativeResponse extends BaseAPIResponse {
  RelativeResponseData? data;

  RelativeResponse({
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

  RelativeResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['data'] != null) {
      data = RelativeResponseData.fromJson(json['data']);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
