import 'dart:io';
import 'dart:convert';

import 'http_errors.dart';
import './parser_request.dart';
import 'dart:developer' as devtools;

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
      List<dynamic> dataParsed = await requestAnalyzer(request);

      for(Map<String, dynamic> item in dataParsed) {
        T parded = creator(item);
        resp.add(parded); 
      }
    } on SocketException {
      devtools.log('The device not have internet cennection');
      throw NoConnection("Problem with backend connection");
    }

    return resp;
  } 

  Future<T?> findById<T>(id) async {
    T? resp;

    final uri = Uri.https(domain, endpointBased, query);
    HttpClientRequest request = await httpClient.getUrl(uri);

    try {
      Map<String, dynamic> item = await requestAnalyzer(request);

      resp = creator(item);
    } on SocketException {
      devtools.log('The device not have internet cennection');
      throw NoConnection("Problem with backend connection");
    }

    return resp;
  } 

  Future<T> post<T>(Object body) async {
    T resp;

    final uri = Uri.https(domain, endpointBased, query);

    devtools.log(uri.toString());

    try {

      HttpClientRequest request = await httpClient.postUrl(uri);
      request.headers.set("Content-Type", "application/json; charset=UTF-8");
      request.write(json.encode(body));

      Map<String, dynamic> item = await requestAnalyzer(request);

      resp = creator(item);

    } on SocketException {
      devtools.log('The device not have internet cennection');
      throw NoConnection("Problem with backend connection");
    }

    return resp;
  } 
}