import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suvankars_dictionary/models/dictionary_entry.dart';
import 'package:suvankars_dictionary/services/dictionary_api_service.dart';

final dictionaryDefProvider =
    FutureProvider.family<List<DictionaryEntry>, String>((ref, word) async {
      final DictionaryApiService apiService = DictionaryApiService();
      return apiService.getDefinition(word);
    });
