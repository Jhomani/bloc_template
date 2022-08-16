import 'dart:io';
import 'dart:convert';

typedef ItemCreator = dynamic Function(Map<String, dynamic>);

class ClientRequest {
  String endpoint = '/todos';
  final _domain = 'jsonplaceholder.typicode.com';
  final _query = {'_limit': '5', '_start': '5'};
  final httpClient = HttpClient();

  ItemCreator creator = (m) => null;

  static ClientRequest instance = ClientRequest._internal();

  factory ClientRequest({ItemCreator? creator, String? endpoint}) {
    instance.creator = creator == null ? instance.creator : creator;
    instance.endpoint = endpoint == null ? instance.endpoint : endpoint;

    return instance; 
  }

  ClientRequest._internal();

  Future<List<T>> find<T>() async {
    List<T> resp = [];

    final uri = Uri.https(_domain, endpoint, _query);
    HttpClientRequest request = await httpClient.getUrl(uri);

    try {
      List<dynamic> dataParsed = await requestAnalizer(request);

      for(Map<String, dynamic> item in dataParsed) {
        T parded = creator(item);
        resp.add(parded); 
      }
    } on HttpException catch(e) {
      print('HTTP Error, with ${e.message} code.');
    }

    return resp;
  } 

  Future<T?> findById<T>(String id) async {
    T? resp = null;
    endpoint += '/$id'; 

    final uri = Uri.https(_domain, endpoint, _query);
    HttpClientRequest request = await httpClient.getUrl(uri);

    try {
      Map<String, dynamic> item = await requestAnalizer(request);

      resp = creator(item);
    } on HttpException catch(e) {
      print('HTTP Error, with ${e.message} code.');
    }

    return resp;
  } 

  Future<T?> post<T>(Object body) async {
    T? resp;

    final uri = Uri.https(_domain, endpoint, _query);

    try {
      HttpClientRequest request = await httpClient.postUrl(uri);

      request.headers.set(
        "Content-Type",
        "application/json; charset=UTF-8"
      );

      request.write(json.encode(body));

      Map<String, dynamic> item = await requestAnalizer(request);

      resp = creator(item);
    } on HttpException catch(e) {
      print('HTTP Error, with ${e.message} code.');
    } on SocketException catch (_) {
      print('The device not have internet cennection');
    }

    return resp;
  } 

  Future<dynamic> requestAnalizer(HttpClientRequest request) async {
    var response = await request.close();

    var data = await utf8.decoder.bind(response).toList();
    var dataParsed = json.decode(data.join());

    int respCode = response.statusCode;  

    httpClient.close();

    if(respCode >= 400 && respCode < 500) {
      throw HttpException(respCode.toString());
    }

    return dataParsed; 
  }
}