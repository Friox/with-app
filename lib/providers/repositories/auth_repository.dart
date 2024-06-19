import 'dart:convert';

import 'package:app/models/auth_data_model.dart';
import 'package:app/models/user_profile_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {

  static const _baseUrl = 'https://withapi.friox.dev/auth';

  Future<AuthDataModel> signIn(String id, String pw) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/signin'),
        body: {
          "id": id,
          "pw": pw
        },
      );
      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        if (body['success'] == true && body['data'] != null) {
          return AuthDataModel.fromJson(body['data']);
        } else {
          throw Exception('Login failed: Invalid data');
        }
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileModel?> getUserProfile(String? token) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/getprofile'),
        headers: { "authorization": 'Bearer $token' }
      );
      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        if (body['success'] == true && body['data'] != null) {
          return UserProfileModel.fromJson(body['data']);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}