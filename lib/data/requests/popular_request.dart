import 'dart:convert';
import 'dart:developer';

import 'package:goo4/app/app_consts.dart';
import 'package:goo4/domain/models/popular_model.dart';
import 'package:goo4/domain/models/popular_people_details_model.dart';
import 'package:http/http.dart' as http;

class PopularRequest {
  static Future<PopularModel?> getPopularPeople() async {
    Map<String, String> getPopularPeopleHeaders = {
      "Accept": "application/json",
    };
    Map<String, dynamic> decoded;
    var response = await http.get(
      Uri.parse(AppConsts.popularPeopleAPI),
      headers: getPopularPeopleHeaders,
    );
    if (response.statusCode == 200) {
      decoded = json.decode(response.body);
      log(response.body.toString(), name: "response is :");
      PopularModel popularModel = PopularModel.fromJson(decoded);
      return popularModel;
    } else {
      return null;
    }
  }

  static Future<PopularPeopleDetailsModel?> getPopularPeopleDetails(
    num id,
  ) async {
    Map<String, String> getPopularPeopleHeaders = {
      "Accept": "application/json",
    };
    Map<String, dynamic> decoded;
    var response = await http.get(
      Uri.parse(
        "https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b",
      ),
      headers: getPopularPeopleHeaders,
    );
    if (response.statusCode == 200) {
      decoded = json.decode(response.body);
      log(response.body.toString(), name: "response is :");
      PopularPeopleDetailsModel popularPeopleDetailsModel =
          PopularPeopleDetailsModel.fromJson(decoded);
      return popularPeopleDetailsModel;
    } else {
      return null;
    }
  }
}
