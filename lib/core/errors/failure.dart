import 'exception.dart';

class Failure {
  final String message;
  final int? statusCode;
 
  const Failure({required this.message, this.statusCode});
 

  factory Failure.fromException(AppException exception) {
    return Failure(
      message: exception.message,
      statusCode: exception.errorModel.statusCode,
    );
  }
 
  @override
  String toString() => message;
}
 