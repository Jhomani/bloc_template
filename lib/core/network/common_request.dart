import 'dart:io';
import 'dart:convert';

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

    if(respCode >= 400 && respCode < 500) {
      throw HttpException(respCode.toString());
    }

    return dataParsed; 
  }
}