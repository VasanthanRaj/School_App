class Response {
  final int status;
  final String message;
  final Data data;

  Response({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final int id;
  final String token;

  Data({
    required this.id,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      token: json['token'],
    );
  }
}
