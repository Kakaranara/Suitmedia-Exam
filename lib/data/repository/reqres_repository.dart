import 'dart:convert';

import 'package:suitmedia_test/data/data_provider/reqres_api.dart';
import 'package:suitmedia_test/data/model/Reqres.dart';

class ReqResRepository {
  final api = ReqResAPI();

  Future<List<Reqres>> getPeopleData({required int page}) async {
    final String rawData = await api.getPeopleData(page: page);
    final List<dynamic> decoded = jsonDecode(rawData)['data'];
    final List<Reqres> data =
        decoded.map((json) => Reqres.fromMap(json)).toList();

    return data;
  }
}
