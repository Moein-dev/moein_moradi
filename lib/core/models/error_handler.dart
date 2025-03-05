class ErrorModel {
  final String message;
  final String status;
  final int? statusCode;

  ErrorModel({
    required this.message,
    required this.status,
    this.statusCode,
  });
}
