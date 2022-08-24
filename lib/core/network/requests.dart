import 'dart:io';
import 'dart:convert';
import 'dart:developer' as devtools show log;
import './common_request.dart';

typedef ItemCreator = dynamic Function(Map<String, dynamic>);

class ClientRequest extends CommonRequest {
  static ClientRequest instance = ClientRequest._internal();

  factory ClientRequest({ItemCreator? creator, String? endpoint}) {
    instance.creator = creator ?? instance.creator;
    instance.endpoint = endpoint ?? instance.endpoint;

    return instance; 
  }

  ClientRequest._internal();

  Future<List<T>> find<T>() async {
    List<T> resp = [];

    final uri = Uri.https(domain, endpoint, query);
    HttpClientRequest request = await httpClient.getUrl(uri);

    try {
      List<dynamic> dataParsed = await requestAnalizer(request);

      for(Map<String, dynamic> item in dataParsed) {
        T parded = creator(item);
        resp.add(parded); 
      }
    } on SocketException {
      devtools.log('The device not have internet cennection');
    }

    return resp;
  } 

  Future<T?> findById<T>(String id) async {
    T? resp;
    endpoint += '/$id'; 

    final uri = Uri.https(domain, endpoint, query);
    HttpClientRequest request = await httpClient.getUrl(uri);

    try {
      Map<String, dynamic> item = await requestAnalizer(request);

      resp = creator(item);
    } on SocketException {
      devtools.log('The device not have internet cennection');
    }

    return resp;
  } 

  Future<T?> post<T>(Object body) async {
    T? resp;

    final uri = Uri.https(domain, endpoint, query);

    try {
      HttpClientRequest request = await httpClient.postUrl(uri);

      request.headers.set("Content-Type", "application/json; charset=UTF-8");
      request.write(json.encode(body));

      Map<String, dynamic> item = await requestAnalizer(request);

      resp = creator(item);
    } on SocketException {
      devtools.log('The device not have internet cennection');
    }

    return resp;
  } 
}