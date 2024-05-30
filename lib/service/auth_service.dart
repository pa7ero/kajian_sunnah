import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<dynamic> login(String email, String password) async {
    var headers = {'Accept': 'application/json'};
    var data = FormData.fromMap({'email': email, 'password': password});

    try {
      var response = await _dio.post(
        'https://stackovercode.my.id/api/v1/auth/login',
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 400) {
        throw Exception('Email atau password salah');
      } else {
        throw Exception('Failed to login: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Failed to login: ${e.message}');
    }
  }

  Future<dynamic> register(
    String name,
    String email,
    String password,
    String password_confirmation,
    String address,
    String phone,
    String gender,
  ) async {
    var headers = {'Accept': 'application/json'};
    var data = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
      'address': address,
      'phone': phone,
      'gender': gender,
    });

    try {
      var response = await _dio.post(
        'https://stackovercode.my.id/api/v1/auth/register',
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 422) {
        print("Error 422: ${response.data}");
        throw Exception('Failed to register: ${response.data}');
      }
    } on DioError catch (e) {
      throw Exception('Failed to register: ${e.message}');
    }
  }
}
