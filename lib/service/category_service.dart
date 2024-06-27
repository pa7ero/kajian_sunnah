import 'package:dio/dio.dart';
import 'package:kajian_sunnah/model/category_model.dart';

class CategoryService {
  final Dio _dio = Dio();

  Future<List<Category>> get() async {
    try {
      var response = await _dio.get(
        'https://stackovercode.my.id/api/v1/posts/categories',
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        var data = response.data['result']['tags'];
        if (data is List) {
          return data.map((e) => Category.fromJson(e)).toList();
        } else {
          throw Exception('Data yang diterima bukan list');
        }
      } else {
        throw Exception(
            'Gagal memuat category dengan status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching topics: ${e.toString()}');
      return [];
    }
  }
}
