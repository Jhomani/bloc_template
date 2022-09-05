import 'dart:io';
import 'dart:convert';
import 'dart:developer' as devtools;

import 'package:template/core/constants/endpoints.dart';
import 'http_errors.dart';
import 'package:template/env.dart' as env;

typedef ItemCreator = dynamic Function(Map<String, dynamic>);

class CommonRequest {
  String endpoint = '/';
  final domain = env.baseUrl;
  final query = {'_limit': '5', '_start': '5'};
  ItemCreator creator = (m) => null;

  final httpClient = HttpClient();

  String get endpointBased => Endpoint.base + endpoint;

  Future<dynamic> requestAnalyzer(HttpClientRequest request) async {
    var response = await request.close();
    int respCode = response.statusCode;

    var rawData = await response.transform(utf8.decoder).join();
    var dataParsed = {};

    try {
      dataParsed = jsonDecode(rawData);
    } on FormatException {
      devtools.log("Error while parsing response!");
      throw InternalError(respCode.toString());
    }

    if(respCode == 401) {
      throw Unauthorized("You are not authorized to this action");
    } else if(respCode == 404) {
      throw EntityNotFound("Entity not found");
    } else  if(respCode >= 400 && respCode < 500) {
      throw HttpException(respCode.toString());
    } else  if(respCode >= 500 && respCode < 600)  {
      throw InternalError(respCode.toString());
    } 

    httpClient.close();
    return dataParsed['data']; 
  }
}