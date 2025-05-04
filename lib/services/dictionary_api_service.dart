import 'package:dio/dio.dart';
import 'package:suvankars_dictionary/models/dictionary_entry.dart';

class DictionaryApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.50:8080/api/v1',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<DictionaryEntry>> getDefinition(String word) async {
    try {
      final response = await _dio.get(
        '/definitions',
        queryParameters: {'word': word},
      );

      return List<DictionaryEntry>.from(
        response.data.map((x) => DictionaryEntry.fromJson(x)),
      );
    } on DioException catch (e) {
      throw Exception('Failed to fetch definition: ${e.message}');
    }
  }
}
