import 'package:dio/dio.dart';
import '../models/test_model.dart';

class TestService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://wsb.arthabuanamandiri.com/tests/';

  Future<Welcome> getTestData() async {
    try {
      final response = await _dio.get(_baseUrl);
      return welcomeFromJson(response.toString());
    } catch (e) {
      throw Exception('Gagal mengambil data: $e');
    }
  }
}