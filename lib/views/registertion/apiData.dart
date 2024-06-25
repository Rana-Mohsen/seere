//import 'dart:js_interop';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  // for login
  Future<Response<dynamic>> loginUser(
      String username, String password, bool tt) async {
    try {
      final response = await _dio.post(
        'https://seere.somee.com/api/Account/login',
        data: {'email': username, 'password': password, 'rememberMe': tt},
      );
      return response;
    } catch (error) {
      throw Exception('Try again');
    }
  }

  //for register
  Future<Response<dynamic>> signupUser(String email, String password,
      String confirmPassword, String name) async {
    try {
      final response = await _dio.post(
        'https://seere.somee.com/api/Account/register',
        data: {
          'email': email,
          'password': password,
          'confirmPassword': password,
          'name': name
        },
      );
      return response;
    } catch (error) {
      throw Exception('Try again');
    }
  }

  // for forget password
  Future<Response<dynamic>> forgetPassword(String email) async {
    try {
      final response = await _dio.post(
        'https://seere.somee.com/api/Account/forgetpassword',
        data: {'email': email},
      );
      return response;
    } catch (error) {
      throw Exception('Try again');
    }
  }
}
