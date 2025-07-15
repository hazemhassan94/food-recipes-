import 'dart:convert';

import 'package:dio/dio.dart';

class AdviceRemoteDatasource {
  final Dio _dio = Dio();
  final String _url = 'https://api.adviceslip.com/advice';

  Future<String> getRandomAdvice() async {
    try {
      final response = await _dio.get(_url);
      if (response.statusCode == 200) {
        final data = response.data is String
            ? jsonDecode(response.data)
            : response.data;
        return data['slip']['advice'];
      } else {
        throw Exception('Failed to load advice');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
