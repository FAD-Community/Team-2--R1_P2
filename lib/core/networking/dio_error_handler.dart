import 'package:dio/dio.dart';
import '../errors/api_error_model.dart';
import '../errors/exception.dart';
import 'status_code.dart';


class ErrorHandler {
  ErrorHandler._();

  static AppException handle(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    }
    return UnknownException(ApiErrorModel(message: error.toString()));
  }

  static AppException _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(
          ApiErrorModel(message: 'استغرق الاتصال وقت طويل، حاول تاني'),
        );

      case DioExceptionType.cancel:
        return CancelException(ApiErrorModel(message: 'تم إلغاء الطلب'));

      case DioExceptionType.connectionError:
        return NoInternetConnectionException(
          ApiErrorModel(message: 'تأكد من اتصالك بالإنترنت'),
        );

      case DioExceptionType.badResponse:
        return _handleStatusCode(error);

      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return UnknownException(
          ApiErrorModel(message: 'حصل خطأ غير متوقع، حاول تاني'),
        );
      case DioExceptionType.transformTimeout:
        throw UnimplementedError();
    }
  }

  static AppException _handleStatusCode(DioException error) {
    final statusCode = error.response?.statusCode;
    final errorModel = ApiErrorModel.fromJson(error.response?.data);

    switch (statusCode) {
      case StatusCode.badRequest:
        return BadRequestException(errorModel);
      case StatusCode.unauthorized:
        return UnauthorizedException(errorModel);
      case StatusCode.forbidden:
        return ForbiddenException(errorModel);
      case StatusCode.notFound:
        return NotFoundException(errorModel);
      case StatusCode.conflict:
        return ConflictException(errorModel);
      case StatusCode.unprocessableEntity:
        return UnprocessableEntityException(errorModel);
      default:
        if (statusCode! >= 500) {
          return InternalServerErrorException(errorModel);
        }
        return UnknownException(errorModel);
    }
  }
}
