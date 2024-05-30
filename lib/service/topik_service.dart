import 'package:dio/dio.dart';

class TopikService {
  final Dio _dio = Dio();

  Future<List> get() async {
    var response = await _dio.get(
      'https://stackovercode.my.id/api/v1/posts/topics',
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
    );

    Map obj = response.data;
    return obj['tags'];
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
    return obj['tags']['parent_id'];
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
    return obj['tags'];
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
