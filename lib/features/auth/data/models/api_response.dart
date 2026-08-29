class ApiResponse<T> {
  final String message;
  final T data;

  ApiResponse({required this.message, required this.data});
}
