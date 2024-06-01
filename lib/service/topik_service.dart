import 'package:dio/dio.dart';
import 'package:kajian_sunnah/model/topik_model.dart';

class TopikService {
  final Dio _dio = Dio();

  Future<List<Topik>> get() async {
    try {
      var response = await _dio.get(
        'https://stackovercode.my.id/api/v1/posts/topics',
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        var data = response.data['result']['tags'];
        if (data is List) {
          return data.map((e) => Topik.fromJson(e)).toList();
        } else {
          throw Exception('Data yang diterima bukan list');
        }
      } else {
        throw Exception(
            'Gagal memuat topik dengan status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching topics: ${e.toString()}');
      return [];
    }
  }

  Future create({
    required String name,
    required String description,
    required String parent_id,
  }) async {
    var response =
        await _dio.post('https://stackovercode.my.id/api/v1/posts/topics',
            options: Options(
              headers: {
                'Accept': 'application/json',
                'Content-type': 'multipart/form-data',
                'Authorization': '••••••',
              },
            ),
            data: {
          'name': name,
          'description': description,
          'parent_id': parent_id,
        });

    Map obj = response.data;
    return Topik.fromJson(obj['result']['tags']);
  }

  Future update({
    required String name,
    required String description,
    required int parent_id,
  }) async {
    var response =
        await _dio.put('https://stackovercode.my.id/api/v1/posts/topics/11',
            options: Options(
              headers: {
                'Accept': 'application/json',
                'Content-type': 'application/x-www-form-urlencoded',
                'Authorization': '••••••'
              },
            ),
            data: {
          'name': name,
          'description': description,
          'parent_id': parent_id,
        });

    Map obj = response.data;
    return Topik.fromJson(obj['result']['tags']);
  }

  Future delete() async {
    await _dio.delete(
      'https://stackovercode.my.id/api/v1/posts/topics/11',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/x-www-form-urlencoded',
          'Authorization': '••••••'
        },
      ),
    );
  }
}
