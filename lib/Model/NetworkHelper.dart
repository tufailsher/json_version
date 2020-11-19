import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:jsonversion/Model/modelVersion.dart';
import 'package:http/http.dart'as http;

class Services {
  static const String url =
      'http://182.180.103.133:8080/ords/musa-usman-and-co/builds?project_id=1';

  static Future<List<Version>> getVersions() async {
    try {
      final response = await http.get(url);
      print('working');
      if (200 == response.statusCode) {
        final Map<String, dynamic> resData = jsonDecode(response.body);
        print(resData);
        final List<Version> versions = versionFromJson(resData["data"]);
        print(response.statusCode);
        print(versions);
        return versions;
      } else {
        return List<Version>();
      }
    } catch (e, s) {
      print("Services: GetVersions: UnexpectedError: $e: $s");
      return List<Version>();
    }
  }
}
