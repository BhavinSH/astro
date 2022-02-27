class BaseAPIResponse {
  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;

  BaseAPIResponse({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
  });

  BaseAPIResponse.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['httpStatus'] = httpStatus;
    data['httpStatusCode'] = httpStatusCode;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
