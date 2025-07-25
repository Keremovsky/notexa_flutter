import 'package:dio/dio.dart';

extension ResponseExtension on Response {
  bool get isSuccess =>
      statusCode == 200 ||
      statusCode == 201 ||
      statusCode == 202 ||
      statusCode == 203 ||
      statusCode == 204;
}
