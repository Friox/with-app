import 'dart:convert';

import 'package:app/models/mission_model.dart';
import 'package:app/providers/notifiers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class MissionRepository {

  final ProviderContainer _container;
  static const _baseUrl = 'https://withapi.friox.dev/mission';

  String? token;

  MissionRepository(this._container) {
    _container.listen(authNotifierProvider, (previous, next) async {
      token = await _container.read(authNotifierProvider.notifier).getToken();
      print(token);
    },);
  }

  Future<List<Mission>> getMissionList(int type) async {
    if (token == null) return [];
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/getMissionList?type=$type'),
        headers: { "Authorization": token! },
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['success'] == true && body['data'] != null) {
          List<Mission> temp = [...body['data'].map((el) => Mission.fromJson(el))];
          return temp;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  } 

}