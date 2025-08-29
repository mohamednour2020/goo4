import 'dart:convert';

import 'package:goo4/app/app_consts.dart';
import 'package:goo4/domain/models/popular_model.dart';
import 'package:http/http.dart' as http;

class PopularRequest {


  Future<PopularModel?> getPopularPeople() async {
    Map<String, String> getPopularPeopleHeaders = {"Accept": "application/json"};
    Map<String, dynamic> decoded;
    var response = await http.get(
      Uri.parse(AppConsts.popularPeopleAPI),
      headers: getPopularPeopleHeaders,
    );
    if (response.statusCode == 200) {
      decoded = json.decode(response.body);
      PopularModel popularModel = PopularModel.fromJson(decoded);
      return popularModel;
    } else {
      return null;
    }
  }
}
