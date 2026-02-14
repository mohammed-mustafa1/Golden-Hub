import 'package:dio/dio.dart';
import 'package:golden_hub/core/constants/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;

  Future<Response> get({required String endpoint}) async {
    final response = await _dio.get(
      ApiConstants.baseUrl + endpoint,

      options: Options(
        headers: {
          'User-Agent': 'GoldenHub/1.0.0',
          'x-api-key': ApiConstants.apiKey,
        },
      ),
    );
    return response;
  }
}
