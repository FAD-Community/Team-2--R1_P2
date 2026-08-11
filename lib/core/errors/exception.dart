import 'api_error_model.dart';

abstract class AppException implements Exception {
  final ApiErrorModel errorModel;
  const AppException(this.errorModel);

  String get message => errorModel.message ?? 'حصل خطأ، حاول تاني';

  @override
  String toString() => message;
}

class BadRequestException extends AppException {
  const BadRequestException(super.errorModel);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(super.errorModel);
}

class ForbiddenException extends AppException {
  const ForbiddenException(super.errorModel);
}

class NotFoundException extends AppException {
  const NotFoundException(super.errorModel);
}

class ConflictException extends AppException {
  const ConflictException(super.errorModel);
}

class UnprocessableEntityException extends AppException {
  const UnprocessableEntityException(super.errorModel);
}

class InternalServerErrorException extends AppException {
  const InternalServerErrorException(super.errorModel);
}

class NoInternetConnectionException extends AppException {
  const NoInternetConnectionException(super.errorModel);
}

class TimeoutException extends AppException {
  const TimeoutException(super.errorModel);
}

class CancelException extends AppException {
  const CancelException(super.errorModel);
}

class UnknownException extends AppException {
  const UnknownException(super.errorModel);
}
