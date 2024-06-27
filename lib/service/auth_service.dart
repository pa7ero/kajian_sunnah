import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<dynamic> login(String email, String password) async {
    // final token = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/json',
      // 'autorization': 'Bearer $token',
    };
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
        //make shared preferences seter
        // final prefs = await SharedPreferences.getInstance();
        // prefs.setString('token', response.data['token']);

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

  // Future<String> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('token') ?? '';
  // }

  // Future<void> logout() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove('token');
  // }

  Future<dynamic> register(
    String name,
    String email,
    String password,
    String password_confirmation,
    String address,
    String phone,
    String gender,
  ) async {
    var headers = {
      'Accept': 'application/json',
    };
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
