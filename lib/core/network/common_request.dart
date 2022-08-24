import 'dart:io';
import 'dart:convert';
import './http_errors.dart';

typedef ItemCreator = dynamic Function(Map<String, dynamic>);

class CommonRequest {
  String endpoint = '/todos';
  final domain = 'jsonplaceholder.typicode.com';
  final query = {'_limit': '5', '_start': '5'};
  ItemCreator creator = (m) => null;

  final httpClient = HttpClient();

  Future<dynamic> requestAnalizer(HttpClientRequest request) async {
    var response = await request.close();

    var rawData = await response.transform(utf8.decoder).join();
    var dataParsed = json.decode(rawData);

    int respCode = response.statusCode;  

    httpClient.close();

    if(respCode == 401) {
      throw Unauthorized("You are not authorized to this action");
    } if(respCode >= 400 && respCode < 500) {
      throw HttpException(respCode.toString());
    } if(respCode >= 500 && respCode < 600)  {
      throw InternalError(respCode.toString());
    }

    return dataParsed; 
  }
}