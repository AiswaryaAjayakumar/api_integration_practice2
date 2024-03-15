// ignore_for_file: unused_local_variable, avoid_print, unused_element

import 'dart:convert';

import 'package:api_integration_practice2/model/home_screen_model/sample_api_res.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  SampleApiRes? apiRes;

  Future<void> fetchData() async {
    final url = Uri.parse("http://3.93.46.140/employees/");
    var response = await http.get(url);
    //print(response);

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      apiRes = SampleApiRes.fromJson(decodeData);
      // print(apiRes.data?.first.role);
      print(apiRes?.data?.first.name);
      notifyListeners();
    } else {
      print("Api Failed");
    }
    // print(response.statusCode);
    // print(response.body);
  }

  deleteData(int id) async {
    final url = Uri.parse("http://3.93.46.140/employees/$id/");
    var responsDel = await http.delete(url);

    if (responsDel.statusCode == 200) {
      var decodeData = jsonDecode(responsDel.body);
      apiRes = SampleApiRes.fromJson(decodeData);
      notifyListeners();
    } else {
      print("Delete Failed");
    }
  }
}
