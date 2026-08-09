
class ApiErrorModel {
  final String? message;
  final int? statusCode;

  // لو فيه validation errors لكل field
  final Map<String, dynamic>? errors; 
  ApiErrorModel({this.message, this.statusCode, this.errors});
 
  factory ApiErrorModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return ApiErrorModel(message: json?.toString());
    }
    return ApiErrorModel(
      message: json['message'] ?? json['error'] ?? json['msg'],
      statusCode: json['statusCode'] ?? json['status_code'],
      errors: json['errors'] is Map<String, dynamic> ? json['errors'] : null,
    );
  }
}
 