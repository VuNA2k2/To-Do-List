class ResponseError {
  String code;
  String message;
  ResponseError({required this.code, required this.message});
  factory ResponseError.fromJson(Map<String, dynamic> json) {
    return ResponseError(
      code: json['code'],
      message: json['message'],
    );
  }
}